require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSinglePollSession < CanvasBaseMutation
          argument :poll_id, String, required: true
          argument :poll_sessions_course_id, Int, required: true
          argument :poll_sessions_course_section_id, Int, required: false
          argument :poll_sessions_has_public_results, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(poll_id:, poll_sessions_course_id:, poll_sessions_course_section_id: nil, poll_sessions_has_public_results: nil)
            ctx[:canvas_api].proxy(
              "CREATE_SINGLE_POLL_SESSION",
              {
                "poll_id": poll_id,
                "poll_sessions[course_id]": poll_sessions_course_id,
                "poll_sessions[course_section_id]": poll_sessions_course_section_id,
                "poll_sessions[has_public_results]": poll_sessions_has_public_results              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end