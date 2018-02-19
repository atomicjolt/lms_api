require "support/http_party"
require "support/webmocks"

require "lms_api"
require "ostruct"
require "thread"
require "byebug"
def thread_log(msg)
  print "[#{Thread.current.object_id}] #{msg}\n" if ENV["THREAD_LOG"]
end

class TestAuthRecord
  attr_reader :id, :provider, :token, :provider_url

  def initialize(id, provider, token, provider_url)
    @id = id
    @provider = provider
    @token = token
    @provider_url = provider_url
  end

  def update(hash)
    @token = hash[:token]
  end
end

class TestAuthStateModel
  def initialize(initial_token, base_uri)
    @auth_mutex = Mutex.new
    @turn_mutex = Mutex.new
    @turn = ConditionVariable.new
    @record = TestAuthRecord.new(1, "canvas", initial_token, base_uri)
  end

  def transaction
    @auth_mutex.synchronize do
      signal_turn
      sleep 0.5 # mimic a delay in the transaction
      yield
    end
  end

  def lock(true_or_false)
    # crickets...
    self
  end

  def find(id)
    if id == @record.id
      @record
    end
  end

  # the following methods are not part of the required auth state model
  # interface, but are used to support the tests

  def signal_turn
    @turn.signal
  end

  def wait_turn
    @turn_mutex.synchronize { @turn.wait(@turn_mutex) }
  end
end

describe LMS::Canvas do
  before do
    @course_id = 11
    @token = "test"
    @base_uri = "http://www.example.com"
    @authentication = OpenStruct.new(id: 1,
                                     provider: "canvas",
                                     token: @token,
                                     provider_url: @base_uri)
    @api = LMS::Canvas.new(@authentication.provider_url, @authentication)
    @external_tool_id = 1
    @tool_config = {
      "config_type" => "by_xml",
      "config_xml" => ""
    }
  end

  describe "initialization" do
    it "doesn't raise an exception if the user doesn't pass options" do
      expect(@api).to be_present
    end
    it "raises an error if the user passes invalid options" do
      too_many_options = {
        client_id: 1,
        client_secret: "a secret",
        refresh_token: "a refresh token",
        redirect_uri: "http://www.example.com",
        invalid_option: "bad value"
      }
      expect do
        LMS::Canvas.new(@authentication.provider_url, @authentication, too_many_options)
      end.to raise_exception(LMS::Canvas::InvalidRefreshOptionsException)
    end
    it "raises an error if the user doesn't pass all required options" do
      too_few_options = {
        client_id: 1,
        client_secret: "a secret",
        refresh_token: "a refresh token"
      }
      expect do
        LMS::Canvas.new(@authentication.provider_url, @authentication, too_few_options)
      end.to raise_exception(LMS::Canvas::InvalidRefreshOptionsException)
    end
  end

  describe "api_put_request" do
    it "calls the given url with a PUT request" do
      payload = {}
      result = http_party_put_response
      expect(HTTParty).to receive(:put).
        with("#{@base_uri}/api/v1/courses", headers: @api.headers, body: payload).
        and_return(result)
      @api.api_put_request("courses", payload)
    end
  end

  describe "api_post_request" do
    it "calls the given url with a POST request" do
      payload = {}
      result = http_party_post_response
      expect(HTTParty).to receive(:post).
        with("#{@base_uri}/api/v1/courses", headers: @api.headers, body: payload).
        and_return(result)
      @api.api_post_request("courses", payload)
    end
  end

  describe "api_delete_request" do
    it "calls the given url with a DELETE request" do
      result = http_party_delete_response
      expect(HTTParty).to receive(:delete).
        with("#{@base_uri}/api/v1/courses", headers: @api.headers).
        and_return(result)
      @api.api_delete_request("courses")
    end
  end

  describe "api_get_request" do
    it "calls the given url with a GET request" do
      result = http_party_get_response
      expect(HTTParty).to receive(:get).
        with("#{@base_uri}/api/v1/courses", headers: @api.headers).
        and_return(result)
      @api.api_get_request("courses")
    end
  end

  describe "api_get_all_request" do
    it "should return all results from the api call" do
      results = @api.api_get_all_request("#{@base_uri}/api/v1/courses")
      expect(results.length).to eq(16)
      expect(results.first["course_code"]).to eq("Biology")
      expect(results[8]["course_code"]).to eq("Biology")
    end
  end

  describe "api_get_blocks_request" do
    it "yields results from the lms api to the block" do
      times_called = 0
      @api.api_get_blocks_request("#{@base_uri}/api/v1/courses") do |result|
        times_called += 1
        expect(result.first["course_code"]).to eq("Biology")
      end
      expect(times_called).to eq(2)
    end
  end

  REFRESH_OPTIONS = {
    client_id: 1,
    client_secret: "a secret",
    refresh_token: "a refresh token",
    redirect_uri: "http://www.example.com"
  }.freeze

  describe "force_refresh" do
    it "immediately attempts to refresh the token" do
      auth_state_model = TestAuthStateModel.new(@token, @base_uri)
      LMS::Canvas.auth_state_model = auth_state_model
      authentication = OpenStruct.new(id: 1,
                                       provider: "canvas",
                                       token: @token,
                                       provider_url: @base_uri)
      api = LMS::Canvas.new(authentication.provider_url, authentication, REFRESH_OPTIONS)
      refresh_result = http_party_post_response(200, "OK", '{"access_token":"anewtoken"}')

      expect(HTTParty).to receive(:post).
      with("#{@base_uri}/login/oauth2/token",
           headers: api.headers,
           body: { grant_type: "refresh_token" }.merge(REFRESH_OPTIONS)).
      and_return(refresh_result).ordered
      authentication = api.force_refresh
      expect(authentication.token).to eq("anewtoken")
    end
  end

  describe "401 unauthorized" do
    context "standard 401" do
      it "raises an exception" do
        result = http_party_get_response(401, "OK", "")
        expect(HTTParty).to receive(:get).
          with("#{@base_uri}/api/v1/courses", headers: @api.headers).
          and_return(result)
        expect { @api.api_get_request("courses") }.
          to raise_exception do | err|
            expect(err.class).to be(LMS::Canvas::InvalidAPIRequestException)
            expect(err.status).to eq(401)
          end
      end
    end

    context "token has expired" do
      before do
        @options = {
          client_id: 1,
          client_secret: "a secret",
          refresh_token: "a refresh token",
          redirect_uri: "http://www.example.com"
        }
        @initial_result = http_party_get_response(
          401,
          "OK",
          "",
          { "WWW-Authenticate" => 'Bearer realm="canvas-lms"' }
        )
        @refresh_result = http_party_post_response(200, "OK", '{"access_token":"anewtoken"}')
        @final_result = http_party_get_response(200, "OK", '{"courses":"there are many"}')
      end

      it "refreshes the token" do
        api = LMS::Canvas.new(@authentication.provider_url, @authentication, REFRESH_OPTIONS)
        expect(HTTParty).to receive(:post).
          with("#{@base_uri}/login/oauth2/token",
               headers: @api.headers,
               body: { grant_type: "refresh_token" }.merge(REFRESH_OPTIONS)).
          and_return(@refresh_result).ordered
        expect(api.refresh_token).to eq("anewtoken")
      end

      it "raises LMS::RefreshTokenRequired if options are not provided" do
        api = LMS::Canvas.new(@authentication.provider_url, @authentication)
        expect(HTTParty).to receive(:get).
          with("#{@base_uri}/api/v1/courses", headers: @api.headers).
          and_return(@initial_result)
        expect do
          api.api_get_request("courses")
        end.to raise_exception(LMS::Canvas::RefreshTokenRequired)
      end

      describe "default reauthentication model with multiple processes" do
        before(:each) do
          @auth_state_model = TestAuthStateModel.new(@token, @base_uri)
          LMS::Canvas.auth_state_model = @auth_state_model
        end

        it "should only call the refresh token LMS API once" do
          thread1 = Thread.new do
            thread_log "thread #1"

            api = LMS::Canvas.new(@authentication.provider_url, @authentication, @options)
            expect(HTTParty).to receive(:get).
              with("#{@base_uri}/api/v1/courses", headers: api.headers).
              and_return(@initial_result)
            expect(HTTParty).to receive(:post).
              with("#{@base_uri}/login/oauth2/token",
                   headers: api.headers,
                   body: { grant_type: "refresh_token" }.merge(@options)).
              and_return(@refresh_result)
            expect(HTTParty).to receive(:get).
              with("#{@base_uri}/api/v1/courses",
                   headers: api.headers.merge({ "Authorization" => "Bearer anewtoken" })).
              and_return(@final_result)

            api.api_get_request("courses")
            @auth_state_model.signal_turn
          end

          thread2 = Thread.new do
            thread_log "thread #2, waiting for turn"
            @auth_state_model.wait_turn
            thread_log "green light!"

            api = LMS::Canvas.new(@authentication.provider_url, @authentication, @options)
            expect(HTTParty).to receive(:get).
              with("#{@base_uri}/api/v1/courses", headers: api.headers).
              and_return(@initial_result)
            expect(HTTParty).not_to receive(:post)
            expect(HTTParty).to receive(:get).
              with("#{@base_uri}/api/v1/courses", headers: api.headers.merge({"Authorization"=>"Bearer anewtoken"})).
              and_return(@final_result)

            api.api_get_request("courses")
          end

          # wait for both to finish
          thread1.join
          thread2.join
        end
      end

    end
  end


  describe "get_next_url" do
    it "Returns the rel='next' url" do
      link = %Q{<https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueA>; rel="current",
                <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueB>; rel="next",
                <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueC>; rel="first",
                <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueD>; rel="last"}
      url = @api.get_next_url(link)
      expect(url).to eq('https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueB')
    end

    it "removes whitespace from the rel='next' url" do
      link = %Q{<https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueA>; rel="current",
                <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueB>; rel="next",
                <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueC>; rel="first",
                <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueD>; rel="last"}
      url = @api.get_next_url(link)
      expect(url).to eq('https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueB')
    end

    it "Returns nil when rel='next' is not available" do
      link = %Q{<https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueA>; rel="current",
          <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueC>; rel="first",
          <https://example.instructure.com/api/v1/courses/45/discussion_topics.json?opaqueD>; rel="last"}
      url = @api.get_next_url(link)
      expect(url).to eq(nil)
    end

    it "handles nil values" do
      url = @api.get_next_url(nil)
      expect(url).to eq(nil)
    end
  end

  describe "proxy" do
    it "uses type to call the lms api to get courses" do
      result = @api.proxy("LIST_YOUR_COURSES", {})
      expect(result.count).to eq(8)
    end

    it "uses type to call the lms api to get a course" do
      result = @api.proxy("GET_SINGLE_COURSE_COURSES", { id: 244 })
      expect(result["course_code"]).to eq("Biology")
    end

    it "raises an exception if required parameters aren't included" do
      expect { @api.proxy("GET_SINGLE_COURSE_COURSES") }.to raise_exception(ArgumentError)
    end

    it "makes multiple api calls to load all courses" do
      results = @api.proxy("LIST_YOUR_COURSES", {}, nil, true)
      expect(results.count).to eq(16)
    end

    it "makes api with body as hash" do
      payload = { id: 1 }
      expect(payload).to receive(:to_json)
      @api.proxy("LIST_YOUR_COURSES", {}, payload, true)
    end

    it "makes api with body as string" do
      payload = "{}"
      expect(payload).not_to receive(:to_json)
      @api.proxy("LIST_YOUR_COURSES", {}, payload, true)
    end

    it "makes api with body as string" do
      payload = {
        account: { name: "Canvas Demo Courses" }
      }.to_json

      params = {
        type: "CREATE_NEW_SUB_ACCOUNT",
        lti_key: "lti-key",
        account_id: 1,
        format: :json
      }

      expect(payload).not_to receive(:to_json)
      @api.proxy("CREATE_NEW_SUB_ACCOUNT", params, payload, true)
    end

    it "doesn't crash with an empty string" do
      payload = ""
      expect(payload).not_to receive(:to_json)
      @api.proxy("LIST_YOUR_COURSES", {}, payload, true)
    end

    it "calls the provided block for each page of data returned" do
      block_calls = 0
      @api.proxy("LIST_YOUR_COURSES", {}) do |results|
        expect(results.count).to eq(8)
        expect(results[0]["course_code"]).to eq("Biology")
        block_calls += 1
      end
      expect(block_calls).to eq(2)
    end

    it "calls the helper method all_accounts" do
      result = @api.proxy("HELPER_ALL_ACCOUNTS", {})
      accounts = JSON.parse(result.body)
      expect(accounts[0]["id"]).to eq(43460000000000001)
      expect(accounts[0]["name"]).to eq("Atomic Jolt")
      expect(accounts.length).to eq(3)
    end
  end

  describe "check_result" do
    before do
      @method = "GET"
      @api_url = "http://www.example.com"
      @payload = ""
      @additional_headers = ""
    end

    it "should raise an InvalidAPIRequestException if 401 not authorized" do
      result = http_party_get_response(401, 'Unauthorized')
      expect { @api.check_result(result) }.to raise_exception(LMS::Canvas::InvalidAPIRequestException)
    end

    it "should raise an InvalidAPIRequestException if 404 not found" do
      result = http_party_get_response(404, 'Not Found')
      expect { @api.check_result(result) }.to raise_exception(LMS::Canvas::InvalidAPIRequestException)
    end

    it "should raise an InvalidAPIRequestException if lms call fails" do
      result = http_party_get_response(500, 'Internal Server Error', '{"errors":"Something terrible"}')
      expect { @api.check_result(result) }.to raise_exception(LMS::Canvas::InvalidAPIRequestException)
    end

    it "should return the result for a 200" do
      result = http_party_get_response
      expect(@api.check_result(result)).to eq(result)
    end

    it "should return the result for a 201" do
      result = http_party_get_response(201)
      expect(@api.check_result(result)).to eq(result)
    end
  end

  it "only allows query params in the query" do
    id = 5
    course_id = 6
    params = {id: id, course_id: course_id, controller: "foo", account_id: 1, all_dates: true, other_param: "foobar"}
    url = LMS::Canvas.lms_url("GET_SINGLE_ASSIGNMENT", params)
    expect(url).to eq("courses/#{course_id}/assignments/#{id}?all_dates=true")
  end

  it "Doesn't include post parameters in the query" do
    course_id = 6
    params = {course_id: course_id, assignment: { name: "The name", position: 2, submission_types: "online_quiz"}}
    url = LMS::Canvas.lms_url("CREATE_ASSIGNMENT", params)
    expect(url).to eq("courses/#{course_id}/assignments")
  end

  context "Common API requests using proxy" do

    describe "courses" do
      it "should retrieve courses from the LMS API" do
        courses = @api.proxy("LIST_YOUR_COURSES", {}, nil, true)
        expect(courses.length).to be > 0
      end
    end

    describe "is account admin" do
      it "Returns account information when the user is an account admin" do
        result = @api.proxy("GET_SINGLE_ACCOUNT", {id: "self"}, nil, true)
        expect(result[0]['id']).to eq(43460000000000001)
      end

      it "Returns false when the user is not an account admin" do
        stub_request(:get, %r|http[s]*://www.example.com/api/v1/accounts/self|).
          to_return(
            :status => 401,
            body: "",
            headers: lms_headers)
        expect { @api.proxy("GET_SINGLE_ACCOUNT", {id: "self"}, nil, true) }.to raise_error(LMS::Canvas::InvalidAPIRequestFailedException)
      end
    end

    describe "all_accounts" do
      before do
        @accounts = @api.all_accounts
      end

      it "loads all accounts including subaccounts" do
        expect(@accounts.length).to eq(3)
      end

      it "loads top level account" do
        account = @accounts.detect { |a| a["name"] == "Atomic Jolt" }
        expect(account).to be_present
      end

      it "loads sub-accounts" do
        account = @accounts.detect { |a| a["name"] == "Canvas Demo Courses" }
        expect(account).to be_present
      end
    end

    describe "accounts" do
      it "should retrieve accounts from the LMS API" do
        accounts = @api.proxy("LIST_ACCOUNTS", {}, nil, true)
        expect(accounts.length).to be > 0
      end
    end

    describe "sub_accounts" do
      it "should retrieve sub accounts from the LMS API for the given account" do
        accounts = @api.proxy("GET_SUB_ACCOUNTS_OF_ACCOUNT", { account_id: "43460000000000001" })
        expect(accounts.length).to be > 0
        manual = accounts.detect { |a| a["id"] == 43460000000000002 }
        expect(manual).to be_present
        demo = accounts.detect { |a| a["id"] == 43460000000000017 }
        expect(demo).to be_present
      end
    end

    describe "get course lti tools" do
      it "should find installed LTI tools for the given course" do
        tools = @api.proxy("LIST_EXTERNAL_TOOLS_COURSES", {course_id: @course_id})
        expect(tools.first["consumer_key"]).to eq("fake")
      end
    end

    describe "update course lti tool" do
      it "should update installed LTI tools for the given course" do
        tool = @api.proxy("EDIT_EXTERNAL_TOOL_COURSES",
          { course_id: @course_id, external_tool_id: @external_tool_id, tool_config: @tool_config })
        expect(tool["consumer_key"]).to eq("fake")
      end
    end

    describe "create course lti tool" do
      it "should create a new LTI tool install for the given course" do
        tool = @api.proxy("CREATE_EXTERNAL_TOOL_COURSES", {
          course_id: @course_id,
          external_tool_id: @external_tool_id,
          name: "test tool",
          privacy_level: "public",
          consumer_key: "thekey",
          shared_secret: "thisisasecret"
        })
        expect(tool["consumer_key"]).to eq("fake")
      end
    end

    describe "lms_url" do
      it "generates a lms url to get accounts" do
        url = LMS::Canvas.lms_url("LIST_ACCOUNTS", {})
        expect(url).to eq("accounts")
      end

      it "generates a lms url with params to get accounts" do
        params = {
          action: "test",
          controller: "test",
          per_page: 100,
          include: ["lti_guid", "registration_settings"]
        }
        url = LMS::Canvas.lms_url("LIST_ACCOUNTS", params)
        expect(url).to eq("accounts?include%5B%5D=lti_guid&include%5B%5D=registration_settings&per_page=100")
      end

      it "generates a lms url to get courses" do
        params = { account_id: 1 }
        url = LMS::Canvas.lms_url("LIST_ACTIVE_COURSES_IN_ACCOUNT", params)
        expect(url).to eq("accounts/1/courses")
      end

      it "generates a lms url to get courses with extra values in params" do
        params = { with_enrollments: true, controller: "foo", account_id: 1 }
        url = LMS::Canvas.lms_url("LIST_ACTIVE_COURSES_IN_ACCOUNT", params)
        expect(url).to eq("accounts/1/courses?with_enrollments=true")
      end

      it "ensures required parameters are present" do
        params = {}
        expect do
          LMS::Canvas.lms_url("LIST_ACTIVE_COURSES_IN_ACCOUNT", params)
        end.to raise_exception(LMS::Canvas::MissingRequiredParameterException)
      end

      it "allows for a scope param to generate custom urls" do
        user_id = 5
        params = {
          scope: "/favorite/color",
          user_id: user_id,
          ns: "com.atomicjolt",
          data: "green",
        }
        uri = LMS::Canvas.lms_url("STORE_CUSTOM_DATA", params)
        expect(uri).to eq("users/#{user_id}/custom_data/favorite/color")
      end

      it "removes dots" do
        user_id = 5
        params = {
          scope: "../../favorite/color",
          user_id: user_id,
          ns: "com.atomicjolt",
          data: "green",
        }
        uri = LMS::Canvas.lms_url("STORE_CUSTOM_DATA", params)
        expect(uri).to eq("users/#{user_id}/custom_data/favorite/color")
      end

      it "only adds scope onto allowed methods" do
        params = {
          account_id: 1,
          scope: "/users"
        }
        url = LMS::Canvas.lms_url("LIST_ACTIVE_COURSES_IN_ACCOUNT", params)
        expect(url).to eq("accounts/1/courses")
      end

      context "with valid payload" do
        it "passes a valid payload" do
          params = {
            course_id: 1,
            assignment: {
              name: "Atomic Jolt the course", submission_types: ["external_tool"], integration_id: "1", integration_data: {
                provider: "atomic-test"
              }, external_tool_tag_attributes: {
                url: "https://test.atomicjolt.xyz/course?course_id=1"
              }
            }, type: "CREATE_ASSIGNMENT", oauth_consumer_key: "scorm-player", controller: "api/canvas_proxy", action: "proxy", canvas_proxy: {
              assignment: {
                name: "Atomic Jolt the course", submission_types: ["external_tool"], integration_id: "1", integration_data: {
                  provider: "atomic-test"
                }, external_tool_tag_attributes: {
                  url: "https://test.atomicjolt.xyz/course?course_id=1"
                }
              }
            }
          }
          payload = "{\"assignment\":{\"name\":\"Atomic Jolt the course\",\"submission_types\":[\"external_tool\"],\"integration_id\":\"1\",\"integration_data\":{\"provider\":\"atomic-test\"},\"external_tool_tag_attributes\":{\"url\":\"https://test.atomicjolt.xyz/course?course_id=1\"}}}"
          url = LMS::Canvas.lms_url("CREATE_ASSIGNMENT", params, payload)
          expect(url).to eq("courses/1/assignments")
        end

        it "passes a payload with missing values" do
          params = {
            assignment: {
              name: "Atomic Jolt the course", submission_types: ["external_tool"], integration_id: "1", integration_data: {
                provider: "atomic-test"
              }, external_tool_tag_attributes: {
                url: "https://test.atomicjolt.xyz/course?course_id=1"
              }
            }, type: "CREATE_ASSIGNMENT", oauth_consumer_key: "scorm-player", controller: "api/canvas_proxy", action: "proxy", canvas_proxy: {
              assignment: {
                name: "Atomic Jolt the course", submission_types: ["external_tool"], integration_id: "1", integration_data: {
                  provider: "atomic-test"
                }, external_tool_tag_attributes: {
                  url: "https://test.atomicjolt.xyz/course?course_id=1"
                }
              }
            }
          }
          payload = "{\"assignment\":{\"name\":\"Atomic Jolt the course\",\"submission_types\":[\"external_tool\"],\"integration_id\":\"1\",\"integration_data\":{\"provider\":\"atomic-test\"},\"external_tool_tag_attributes\":{\"url\":\"https://test.atomicjolt.xyz/course?course_id=1\"}}}"
          expect {
            LMS::Canvas.lms_url("CREATE_ASSIGNMENT", params, payload)
          }.to raise_exception(LMS::Canvas::MissingRequiredParameterException)
        end
      end

    end

  end

  describe "Exceptions" do
    it "Should maintain information about failure in exception.to_s" do
      message = "Nuclear Meltdown"
      exception = LMS::Canvas::CanvasException.new(message)
      expect(exception.to_s).to eq message
    end
  end

end
