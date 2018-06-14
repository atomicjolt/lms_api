require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class UsageRight < BaseType
          description "Files. API Docs: https://canvas.instructure.com/doc/api/files.html"
          field :legal_copyright, String, "Copyright line for the file.Example: (C) 2014 Incom Corporation Ltd", null: true
          field :use_justification, String, "Justification for using the file in a Canvas course. Valid values are 'own_copyright', 'public_domain', 'used_by_permission', 'fair_use', 'creative_commons'.Example: creative_commons", null: true
          field :license, String, "License identifier for the file..Example: cc_by_sa", null: true
          field :license_name, String, "Readable license name.Example: CC Attribution Share-Alike", null: true
          field :message, String, "Explanation of the action performed.Example: 4 files updated", null: true
          field :file_ids, [ID], "List of ids of files that were updated.Example: 1, 2, 3", null: true

        end
      end
    end
  end
end