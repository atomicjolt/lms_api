require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class StudentAttribute < BaseType
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
          field :user_id, Int, "The unique Canvas identifier for the user.Example: 511", null: true
          field :sis_user_id, String, "The SIS ID associated with the user.  This field is only included if the user came from a SIS import and has permissions to view SIS information..Example: SHEL93921", null: true

        end
      end
    end
  end
end