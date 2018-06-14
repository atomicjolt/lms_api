require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Migrator < BaseType
          description "Content Migrations. API Docs: https://canvas.instructure.com/doc/api/content_migrations.html"
          field :type, String, "The value to pass to the create endpoint.Example: common_cartridge_importer", null: true
          field :requires_file_upload, Boolean, "Whether this endpoint requires a file upload.Example: true", null: true
          field :name, String, "Description of the package type expected.Example: Common Cartridge 1.0/1.1/1.2 Package", null: true
          field :required_settings, String, "A list of fields this system requires.Example: source_course_id", null: true

        end
      end
    end
  end
end