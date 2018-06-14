require_relative "../canvas_base_type"
require_relative "sis_import_count"

module LMS
  module GraphQL
    module Types
      module Canvas
        class SisImportDatum < BaseType
          description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
          field :import_type, String, "The type of SIS import.Example: instructure_csv", null: true
          field :supplied_batches, String, "Which files were included in the SIS import.Example: term, course, section, user, enrollment", null: true
          field :counts, LMS::GraphQL::Types::Canvas::SisImportCount, "The number of rows processed for each type of import.", null: true

        end
      end
    end
  end
end