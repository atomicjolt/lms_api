require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SetCourseTimetable < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :timetables_course_section_id, [String], required: false
          argument :timetables_course_section_id_weekdays, String, required: false
          argument :timetables_course_section_id_start_time, String, required: false
          argument :timetables_course_section_id_end_time, String, required: false
          argument :timetables_course_section_id_location_name, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, timetables_course_section_id: nil, timetables_course_section_id_weekdays: nil, timetables_course_section_id_start_time: nil, timetables_course_section_id_end_time: nil, timetables_course_section_id_location_name: nil)
            ctx[:canvas_api].proxy(
              "SET_COURSE_TIMETABLE",
              {
                "course_id": course_id,
                "timetables[course_section_id]": timetables_course_section_id,
                "timetables[course_section_id][weekdays]": timetables_course_section_id_weekdays,
                "timetables[course_section_id][start_time]": timetables_course_section_id_start_time,
                "timetables[course_section_id][end_time]": timetables_course_section_id_end_time,
                "timetables[course_section_id][location_name]": timetables_course_section_id_location_name              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end