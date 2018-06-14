require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class AuthenticationEventEventTypeEnum < ::GraphQL::Schema::Enum
          value "login"
          value "logout"
        end
        class AuthenticationEvent < BaseType
          description "Authentications Log. API Docs: https://canvas.instructure.com/doc/api/authentications_log.html"
          field :created_at, LMS::GraphQL::Types::DateTimeType, "timestamp of the event.Example: 2012-07-19T15:00:00-06:00", null: true
          field :event_type, AuthenticationEventEventTypeEnum, "authentication event type ('login' or 'logout').Example: login", null: true
          field :pseudonym_id, Int, "ID of the pseudonym (login) associated with the event.Example: 9478", null: true
          field :account_id, Int, "ID of the account associated with the event. will match the account_id in the associated pseudonym..Example: 2319", null: true
          field :user_id, Int, "ID of the user associated with the event will match the user_id in the associated pseudonym..Example: 362", null: true

        end
      end
    end
  end
end