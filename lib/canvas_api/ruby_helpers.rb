module CanvasApi
  module RubyHelpers

    def ruby_api_url(api_url)
      api_url.gsub("{", "#\{")
    end

  end
end