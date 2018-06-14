require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/usage_right"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SetUsageRightsGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :file_ids, [ID], required: true
          argument :folder_ids, [ID], required: false
          argument :publish, Boolean, required: false
          argument :usage_rights_use_justification, String, required: true
          argument :usage_rights_legal_copyright, String, required: false
          argument :usage_rights_license, String, required: false
          field :usage_right, LMS::GraphQL::Types::Canvas::UsageRight, null: false
          def resolve(group_id:, file_ids:, folder_ids: nil, publish: nil, usage_rights_use_justification:, usage_rights_legal_copyright: nil, usage_rights_license: nil)
            ctx[:canvas_api].proxy(
              "SET_USAGE_RIGHTS_GROUPS",
              {
                "group_id": group_id,
                "file_ids": file_ids,
                "folder_ids": folder_ids,
                "publish": publish,
                "usage_rights[use_justification]": usage_rights_use_justification,
                "usage_rights[legal_copyright]": usage_rights_legal_copyright,
                "usage_rights[license]": usage_rights_license              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end