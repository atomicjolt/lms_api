require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateFolderCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :name, String, required: true
          argument :parent_folder_id, String, required: false
          argument :parent_folder_path, String, required: false
          argument :lock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :unlock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :locked, Boolean, required: false
          argument :hidden, Boolean, required: false
          argument :position, Int, required: false
          field :folder, LMS::GraphQL::Types::Canvas::Folder, null: false
          def resolve(course_id:, name:, parent_folder_id: nil, parent_folder_path: nil, lock_at: nil, unlock_at: nil, locked: nil, hidden: nil, position: nil)
            ctx[:canvas_api].proxy(
              "CREATE_FOLDER_COURSES",
              {
                "course_id": course_id,
                "name": name,
                "parent_folder_id": parent_folder_id,
                "parent_folder_path": parent_folder_path,
                "lock_at": lock_at,
                "unlock_at": unlock_at,
                "locked": locked,
                "hidden": hidden,
                "position": position              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end