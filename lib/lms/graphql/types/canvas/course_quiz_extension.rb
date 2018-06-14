require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseQuizExtension < BaseType
          description "Course Quiz Extensions. API Docs: https://canvas.instructure.com/doc/api/course_quiz_extensions.html"
          field :user_id, ID, "The ID of the Student that needs the quiz extension..Example: 3", null: true
          field :extra_attempts, Int, "Number of times the student is allowed to re-take the quiz over the multiple-attempt limit..Example: 1", null: true
          field :extra_time, Int, "Amount of extra time allowed for the quiz submission, in minutes..Example: 60", null: true
          field :manually_unlocked, Boolean, "The student can take the quiz even if it's locked for everyone else.Example: true", null: true
          field :end_at, String, "The time at which the quiz submission will be overdue, and be flagged as a late submission..Example: 2013-11-07T13:16:18Z", null: true

        end
      end
    end
  end
end