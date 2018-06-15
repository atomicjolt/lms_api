require "httparty"
require "active_support"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/string/inflections"

require "lms/canvas_urls"
require "lms/helper_urls"

require "canvas_api"

namespace :canvas do

  desc "Scrape the LMS api"
  task :api do
    current_path = File.expand_path(File.dirname(__FILE__))
    client_app_path = File.expand_path(File.join(current_path, "../../../atomic-canvas/src/constants"))
    server_app_path = File.expand_path(File.join(current_path, "../../../atomic-lti"))
    elixir_app_path = File.expand_path(File.join(current_path, "../../../catalyst"))
    rb_graphql_app_path = File.expand_path(File.join(current_path, "../../../lms_graphql_api"))
    project_root = File.expand_path(File.join(current_path, "../../"))
    CanvasApi::Builder.build(project_root, client_app_path, server_app_path, elixir_app_path, rb_graphql_app_path)
  end
end
