require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Collaboration < BaseType
          description "Collaborations. API Docs: https://canvas.instructure.com/doc/api/collaborations.html"
          field :id, Int, "The unique identifier for the collaboration.Example: 43", null: true
          field :collaboration_type, String, "A name for the type of collaboration.Example: Microsoft Office", null: true
          field :document_id, String, "The collaboration document identifier for the collaboration provider.Example: oinwoenfe8w8ef_onweufe89fef", null: true
          field :user_id, Int, "The canvas id of the user who created the collaboration.Example: 92", null: true
          field :context_id, Int, "The canvas id of the course or group to which the collaboration belongs.Example: 77", null: true
          field :context_type, String, "The canvas type of the course or group to which the collaboration belongs.Example: Course", null: true
          field :url, String, "The LTI launch url to view collaboration..", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "The timestamp when the collaboration was created.Example: 2012-06-01T00:00:00-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "The timestamp when the collaboration was last modified.Example: 2012-06-01T00:00:00-06:00", null: true
          field :description, String, "", null: true
          field :title, String, "", null: true
          field :type, String, "Another representation of the collaboration type.Example: ExternalToolCollaboration", null: true
          field :update_url, String, "The LTI launch url to edit the collaboration.", null: true
          field :user_name, String, "The name of the user who owns the collaboration.Example: John Danger", null: true

        end
      end
    end
  end
end