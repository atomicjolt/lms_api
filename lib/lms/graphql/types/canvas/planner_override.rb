require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class PlannerOverride < BaseType
          description "Planner override. API Docs: https://canvas.instructure.com/doc/api/planner_override.html"
          field :id, ID, "The ID of the planner override.Example: 234", null: true
          field :plannable_type, String, "The type of the associated object for the planner override.Example: Assignment", null: true
          field :plannable_id, ID, "The id of the associated object for the planner override.Example: 1578941", null: true
          field :user_id, ID, "The id of the associated user for the planner override.Example: 1578941", null: true
          field :workflow_state, String, "The current published state of the item, synced with the associated object.Example: published", null: true
          field :marked_complete, Boolean, "Controls whether or not the associated plannable item is marked complete on the planner.", null: true
          field :dismissed, Boolean, "Controls whether or not the associated plannable item shows up in the opportunities list.", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "The datetime of when the planner override was created.Example: 2017-05-09T10:12:00Z", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "The datetime of when the planner override was updated.Example: 2017-05-09T10:12:00Z", null: true
          field :deleted_at, LMS::GraphQL::Types::DateTimeType, "The datetime of when the planner override was deleted, if applicable.Example: 2017-05-15T12:12:00Z", null: true

        end
      end
    end
  end
end