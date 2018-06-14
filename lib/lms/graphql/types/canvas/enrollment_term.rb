require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class EnrollmentTerm < BaseType
          description "Enrollment Terms. API Docs: https://canvas.instructure.com/doc/api/enrollment_terms.html"
          field :id, ID, "The unique identifier for the enrollment term..Example: 1", null: true
          field :sis_term_id, ID, "The SIS id of the term. Only included if the user has permission to view SIS information..Example: Sp2014", null: true
          field :sis_import_id, ID, "the unique identifier for the SIS import. This field is only included if the user has permission to manage SIS information..Example: 34", null: true
          field :name, String, "The name of the term..Example: Spring 2014", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "The datetime of the start of the term..Example: 2014-01-06T08:00:00-05:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "The datetime of the end of the term..Example: 2014-05-16T05:00:00-04:00", null: true
          field :workflow_state, String, "The state of the term. Can be 'active' or 'deleted'..Example: active", null: true
          field :overrides, String, "Term date overrides for specific enrollment types.Example: {'start_at'=>'2014-01-07T08:00:00-05:00', 'end_at'=>'2014-05-14T05:00:00-04:0'}", null: true

        end
      end
    end
  end
end