require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateContentMigrationAccount < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :migration_type, String, required: true
          argument :pre_attachment_name, String, required: false
          argument :pre_attachment_star, String, required: false
          argument :settings_file_url, String, required: false
          argument :settings_source_course_id, String, required: false
          argument :settings_folder_id, String, required: false
          argument :settings_overwrite_quizzes, Boolean, required: false
          argument :settings_question_bank_id, Int, required: false
          argument :settings_question_bank_name, String, required: false
          argument :date_shift_options_shift_dates, Boolean, required: false
          argument :date_shift_options_old_start_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :date_shift_options_old_end_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :date_shift_options_new_start_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :date_shift_options_new_end_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :date_shift_options_day_substitutions_X, Int, required: false
          argument :date_shift_options_remove_dates, Boolean, required: false
          field :content_migration, LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          def resolve(account_id:, migration_type:, pre_attachment_name: nil, pre_attachment_star: nil, settings_file_url: nil, settings_source_course_id: nil, settings_folder_id: nil, settings_overwrite_quizzes: nil, settings_question_bank_id: nil, settings_question_bank_name: nil, date_shift_options_shift_dates: nil, date_shift_options_old_start_date: nil, date_shift_options_old_end_date: nil, date_shift_options_new_start_date: nil, date_shift_options_new_end_date: nil, date_shift_options_day_substitutions_X: nil, date_shift_options_remove_dates: nil)
            ctx[:canvas_api].proxy(
              "CREATE_CONTENT_MIGRATION_ACCOUNTS",
              {
                "account_id": account_id,
                "migration_type": migration_type,
                "pre_attachment[name]": pre_attachment_name,
                "pre_attachment[*]": pre_attachment_star,
                "settings[file_url]": settings_file_url,
                "settings[source_course_id]": settings_source_course_id,
                "settings[folder_id]": settings_folder_id,
                "settings[overwrite_quizzes]": settings_overwrite_quizzes,
                "settings[question_bank_id]": settings_question_bank_id,
                "settings[question_bank_name]": settings_question_bank_name,
                "date_shift_options[shift_dates]": date_shift_options_shift_dates,
                "date_shift_options[old_start_date]": date_shift_options_old_start_date,
                "date_shift_options[old_end_date]": date_shift_options_old_end_date,
                "date_shift_options[new_start_date]": date_shift_options_new_start_date,
                "date_shift_options[new_end_date]": date_shift_options_new_end_date,
                "date_shift_options[day_substitutions][X]": date_shift_options_day_substitutions_X,
                "date_shift_options[remove_dates]": date_shift_options_remove_dates              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end