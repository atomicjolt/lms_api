module CanvasApi
  module JsHelpers

    def js_url_parts(api_url)
      api_url.split(/(\{[a-z_]+\})/).map do |part|
        if part[0] == "{"
          arg = part.gsub(/[\{\}]/, "")
          "args['#{arg}']"
        else
          %{"#{part}"}
        end
      end
    end

    def js_args(args)
      if args.present?
        "['#{args.join("', '")}']"
      else
        "[]"
      end
    end

    def parameters_doc(operation, method)
      if operation["parameters"].present?
        parameters = operation["parameters"].
          reject { |p| p["paramType"] == "path" }.
          map { |p| "#{p['name']}#{p['required'] ? ' (required)' : ''}" }.
          compact
        if parameters.present?
          if method == "get"
            "\n// const query = {\n//   #{parameters.join("\n//   ")}\n// }"
          else
            "\n// const body = {\n//   #{parameters.join("\n//   ")}\n// }"
          end
        else
          ""
        end
      else
        ""
      end
    end

    def key_args(args)
      if args.blank?
        ""
      elsif args.length > 1
        "#{nickname}_{#{args.join('}_{')}}"
      else
        "#{nickname}_#{args[0]}"
      end
    end

    def reducer_key(nickname, args)
      "#{nickname}#{key_args(args)}"
    end

  end
end