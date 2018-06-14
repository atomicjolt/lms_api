require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateUser < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :user_name, String, required: false
          argument :user_short_name, String, required: false
          argument :user_sortable_name, String, required: false
          argument :user_time_zone, String, required: false
          argument :user_locale, String, required: false
          argument :user_birthdate, LMS::GraphQL::Types::DateTimeType, required: false
          argument :user_terms_of_use, Boolean, required: false
          argument :user_skip_registration, Boolean, required: false
          argument :pseudonym_unique_id, String, required: true
          argument :pseudonym_password, String, required: false
          argument :pseudonym_sis_user_id, String, required: false
          argument :pseudonym_integration_id, String, required: false
          argument :pseudonym_send_confirmation, Boolean, required: false
          argument :pseudonym_force_self_registration, Boolean, required: false
          argument :pseudonym_authentication_provider_id, String, required: false
          argument :communication_channel_type, String, required: false
          argument :communication_channel_address, String, required: false
          argument :communication_channel_confirmation_url, Boolean, required: false
          argument :communication_channel_skip_confirmation, Boolean, required: false
          argument :force_validations, Boolean, required: false
          argument :enable_sis_reactivation, Boolean, required: false
          argument :destination, String, required: false
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(account_id:, user_name: nil, user_short_name: nil, user_sortable_name: nil, user_time_zone: nil, user_locale: nil, user_birthdate: nil, user_terms_of_use: nil, user_skip_registration: nil, pseudonym_unique_id:, pseudonym_password: nil, pseudonym_sis_user_id: nil, pseudonym_integration_id: nil, pseudonym_send_confirmation: nil, pseudonym_force_self_registration: nil, pseudonym_authentication_provider_id: nil, communication_channel_type: nil, communication_channel_address: nil, communication_channel_confirmation_url: nil, communication_channel_skip_confirmation: nil, force_validations: nil, enable_sis_reactivation: nil, destination: nil)
            ctx[:canvas_api].proxy(
              "CREATE_USER",
              {
                "account_id": account_id,
                "user[name]": user_name,
                "user[short_name]": user_short_name,
                "user[sortable_name]": user_sortable_name,
                "user[time_zone]": user_time_zone,
                "user[locale]": user_locale,
                "user[birthdate]": user_birthdate,
                "user[terms_of_use]": user_terms_of_use,
                "user[skip_registration]": user_skip_registration,
                "pseudonym[unique_id]": pseudonym_unique_id,
                "pseudonym[password]": pseudonym_password,
                "pseudonym[sis_user_id]": pseudonym_sis_user_id,
                "pseudonym[integration_id]": pseudonym_integration_id,
                "pseudonym[send_confirmation]": pseudonym_send_confirmation,
                "pseudonym[force_self_registration]": pseudonym_force_self_registration,
                "pseudonym[authentication_provider_id]": pseudonym_authentication_provider_id,
                "communication_channel[type]": communication_channel_type,
                "communication_channel[address]": communication_channel_address,
                "communication_channel[confirmation_url]": communication_channel_confirmation_url,
                "communication_channel[skip_confirmation]": communication_channel_skip_confirmation,
                "force_validations": force_validations,
                "enable_sis_reactivation": enable_sis_reactivation,
                "destination": destination              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end