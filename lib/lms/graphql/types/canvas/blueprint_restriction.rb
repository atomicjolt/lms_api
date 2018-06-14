require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class BlueprintRestriction < BaseType
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
          field :content, Boolean, "Restriction on main content (e.g. title, description)..Example: true", null: true
          field :points, Boolean, "Restriction on points possible for assignments and graded learning objects.Example: true", null: true
          field :due_dates, Boolean, "Restriction on due dates for assignments and graded learning objects.", null: true
          field :availability_dates, Boolean, "Restriction on availability dates for an object.Example: true", null: true

        end
      end
    end
  end
end