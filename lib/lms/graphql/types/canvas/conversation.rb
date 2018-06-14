require_relative "../canvas_base_type"
require_relative "conversation_participant"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Conversation < BaseType
          description "Conversations. API Docs: https://canvas.instructure.com/doc/api/conversations.html"
          field :id, ID, "the unique identifier for the conversation..Example: 2", null: true
          field :subject, String, "the subject of the conversation..Example: 2", null: true
          field :workflow_state, String, "The current state of the conversation (read, unread or archived)..Example: unread", null: true
          field :last_message, String, "A <=100 character preview from the most recent message..Example: sure thing, here's the file", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "the date and time at which the last message was sent..Example: 2011-09-02T12:00:00Z", null: true
          field :message_count, Int, "the number of messages in the conversation..Example: 2", null: true
          field :subscribed, Boolean, "whether the current user is subscribed to the conversation..Example: true", null: true
          field :private, Boolean, "whether the conversation is private..Example: true", null: true
          field :starred, Boolean, "whether the conversation is starred..Example: true", null: true
          field :properties, String, "Additional conversation flags (last_author, attachments, media_objects). Each listed property means the flag is set to true (i.e. the current user is the most recent author, there are attachments, or there are media objects).", null: true
          field :audience, Int, "Array of user ids who are involved in the conversation, ordered by participation level, then alphabetical. Excludes current user, unless this is a monologue..", null: true
          field :audience_contexts, String, "Most relevant shared contexts (courses and groups) between current user and other participants. If there is only one participant, it will also include that user's enrollment(s)/ membership type(s) in each course/group..", null: true
          field :avatar_url, String, "URL to appropriate icon for this conversation (custom, individual or group avatar, depending on audience)..Example: https://canvas.instructure.com/images/messages/avatar-group-50.png", null: true
          field :participants, [LMS::GraphQL::Types::Canvas::ConversationParticipant], "Array of users participating in the conversation. Includes current user..", null: true
          field :visible, Boolean, "indicates whether the conversation is visible under the current scope and filter. This attribute is always true in the index API response, and is primarily useful in create/update responses so that you can know if the record should be displayed in the UI. The default scope is assumed, unless a scope or filter is passed to the create/update API call..Example: true", null: true
          field :context_name, String, "Name of the course or group in which the conversation is occurring..Example: Canvas 101", null: true

        end
      end
    end
  end
end