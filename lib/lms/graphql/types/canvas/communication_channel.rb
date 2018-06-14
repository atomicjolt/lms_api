require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CommunicationChannelTypeEnum < ::GraphQL::Schema::Enum
          value "email"
          value "push"
          value "sms"
          value "twitter"
        end

                class CommunicationChannelWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "unconfirmed"
          value "active"
        end
        class CommunicationChannel < BaseType
          description "Communication Channels. API Docs: https://canvas.instructure.com/doc/api/communication_channels.html"
          field :id, ID, "The ID of the communication channel..Example: 16", null: true
          field :address, String, "The address, or path, of the communication channel..Example: sheldon@caltech.example.com", null: true
          field :type, CommunicationChannelTypeEnum, "The type of communcation channel being described. Possible values are: 'email', 'push', 'sms', or 'twitter'. This field determines the type of value seen in 'address'..Example: email", null: true
          field :position, Int, "The position of this communication channel relative to the user's other channels when they are ordered..Example: 1", null: true
          field :user_id, ID, "The ID of the user that owns this communication channel..Example: 1", null: true
          field :workflow_state, CommunicationChannelWorkflowStateEnum, "The current state of the communication channel. Possible values are: 'unconfirmed' or 'active'..Example: active", null: true

        end
      end
    end
  end
end