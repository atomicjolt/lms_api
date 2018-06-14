require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateErrorReport < CanvasBaseMutation
          argument :error_subject, String, required: true
          argument :error_url, String, required: false
          argument :error_email, String, required: false
          argument :error_comments, String, required: false
          argument :error_http_env, String, required: false
          field :return_value, Boolean, null: false
          def resolve(error_subject:, error_url: nil, error_email: nil, error_comments: nil, error_http_env: nil)
            ctx[:canvas_api].proxy(
              "CREATE_ERROR_REPORT",
              {
                "error[subject]": error_subject,
                "error[url]": error_url,
                "error[email]": error_email,
                "error[comments]": error_comments,
                "error[http_env]": error_http_env              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end