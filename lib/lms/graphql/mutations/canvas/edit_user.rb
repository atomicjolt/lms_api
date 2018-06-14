require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class EditUser < CanvasBaseMutation
          argument :id, ID, required: true
          argument :user_name, String, required: false
          argument :user_short_name, String, required: false
          argument :user_sortable_name, String, required: false
          argument :user_time_zone, String, required: false
          argument :user_email, String, required: false
          argument :user_locale, String, required: false
          argument :user_avatar_token, String, required: false
          argument :user_avatar_url, String, required: false
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(id:, user_name: nil, user_short_name: nil, user_sortable_name: nil, user_time_zone: nil, user_email: nil, user_locale: nil, user_avatar_token: nil, user_avatar_url: nil)
            ctx[:canvas_api].proxy(
              "EDIT_USER",
              {
                "id": id,
                "user[name]": user_name,
                "user[short_name]": user_short_name,
                "user[sortable_name]": user_sortable_name,
                "user[time_zone]": user_time_zone,
                "user[email]": user_email,
                "user[locale]": user_locale,
                "user[avatar][token]": user_avatar_token,
                "user[avatar][url]": user_avatar_url              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end