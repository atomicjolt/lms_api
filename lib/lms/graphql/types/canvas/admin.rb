require_relative "../canvas_base_type"
require_relative "user"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Admin < BaseType
          description "Admins. API Docs: https://canvas.instructure.com/doc/api/admins.html"
          field :id, ID, "The unique identifier for the account role/user assignment..Example: 1023", null: true
          field :role, String, "The account role assigned. This can be 'AccountAdmin' or a user-defined role created by the Roles API..Example: AccountAdmin", null: true
          field :user, LMS::GraphQL::Types::Canvas::User, "The user the role is assigned to. See the Users API for details..", null: true
          field :workflow_state, String, "The status of the account role/user assignment..Example: deleted", null: true

        end
      end
    end
  end
end