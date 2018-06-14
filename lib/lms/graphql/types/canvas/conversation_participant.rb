require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ConversationParticipant < BaseType
          description "Conversations. API Docs: https://canvas.instructure.com/doc/api/conversations.html"
          field :id, Int, "The user ID for the participant..Example: 2", null: true
          field :name, String, "A short name the user has selected, for use in conversations or other less formal places through the site..Example: Shelly", null: true
          field :full_name, String, "The full name of the user..Example: Sheldon Cooper", null: true
          field :avatar_url, String, "If requested, this field will be included and contain a url to retrieve the user's avatar..Example: https://canvas.instructure.com/images/messages/avatar-50.png", null: true

        end
      end
    end
  end
end