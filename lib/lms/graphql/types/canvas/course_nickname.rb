require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseNickname < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
          field :course_id, ID, "the ID of the course.Example: 88", null: true
          field :name, String, "the actual name of the course.Example: S1048576 DPMS1200 Intro to Newtonian Mechanics", null: true
          field :nickname, String, "the calling user's nickname for the course.Example: Physics", null: true

        end
      end
    end
  end
end