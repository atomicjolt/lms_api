require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SelfRegisterUser < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :user_name, String, required: true
          argument :user_short_name, String, required: false
          argument :user_sortable_name, String, required: false
          argument :user_time_zone, String, required: false
          argument :user_locale, String, required: false
          argument :user_birthdate, LMS::GraphQL::Types::DateTimeType, required: false
          argument :user_terms_of_use, Boolean, required: true
          argument :pseudonym_unique_id, String, required: true
          argument :communication_channel_type, String, required: false
          argument :communication_channel_address, String, required: false
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(account_id:, user_name:, user_short_name: nil, user_sortable_name: nil, user_time_zone: nil, user_locale: nil, user_birthdate: nil, user_terms_of_use:, pseudonym_unique_id:, communication_channel_type: nil, communication_channel_address: nil)
            ctx[:canvas_api].proxy(
              "SELF_REGISTER_USER",
              {
                "account_id": account_id,
                "user[name]": user_name,
                "user[short_name]": user_short_name,
                "user[sortable_name]": user_sortable_name,
                "user[time_zone]": user_time_zone,
                "user[locale]": user_locale,
                "user[birthdate]": user_birthdate,
                "user[terms_of_use]": user_terms_of_use,
                "pseudonym[unique_id]": pseudonym_unique_id,
                "communication_channel[type]": communication_channel_type,
                "communication_channel[address]": communication_channel_address              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end