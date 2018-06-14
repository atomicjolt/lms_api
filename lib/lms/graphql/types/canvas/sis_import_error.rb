require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class SisImportError < BaseType
          description "SIS Import Errors. API Docs: https://canvas.instructure.com/doc/api/sis_import_errors.html"
          field :sis_import_id, ID, "The unique identifier for the SIS import..Example: 1", null: true
          field :file, String, "The file where the error message occurred..Example: courses.csv", null: true
          field :message, String, "The error message that from the record..Example: No short_name given for course C001", null: true
          field :row, Int, "The line number where the error occurred. Some Importers do not yet support this. This is a 1 based index starting with the header row..Example: 34", null: true

        end
      end
    end
  end
end