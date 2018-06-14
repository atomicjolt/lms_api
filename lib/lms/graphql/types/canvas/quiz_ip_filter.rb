require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizIPFilter < BaseType
          description "Quiz IP Filters. API Docs: https://canvas.instructure.com/doc/api/quiz_ip_filters.html"
          field :name, String, "A unique name for the filter..Example: Current Filter", null: true
          field :account, String, "Name of the Account (or Quiz) the IP filter is defined in..Example: Some Quiz", null: true
          field :filter, String, "An IP address (or range mask) this filter embodies..Example: 192.168.1.1/24", null: true

        end
      end
    end
  end
end