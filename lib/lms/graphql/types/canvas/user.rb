require_relative "../canvas_base_type"
require_relative "enrollment"

module LMS
  module GraphQL
    module Types
      module Canvas
        class User < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
          field :id, ID, "The ID of the user..Example: 2", null: true
          field :name, String, "The name of the user..Example: Sheldon Cooper", null: true
          field :sortable_name, String, "The name of the user that is should be used for sorting groups of users, such as in the gradebook..Example: Cooper, Sheldon", null: true
          field :short_name, String, "A short name the user has selected, for use in conversations or other less formal places through the site..Example: Shelly", null: true
          field :sis_user_id, ID, "The SIS ID associated with the user.  This field is only included if the user came from a SIS import and has permissions to view SIS information..Example: SHEL93921", null: true
          field :sis_import_id, ID, "The id of the SIS import.  This field is only included if the user came from a SIS import and has permissions to manage SIS information..Example: 18", null: true
          field :integration_id, ID, "The integration_id associated with the user.  This field is only included if the user came from a SIS import and has permissions to view SIS information..Example: ABC59802", null: true
          field :login_id, ID, "The unique login id for the user.  This is what the user uses to log in to Canvas..Example: sheldon@caltech.example.com", null: true
          field :avatar_url, String, "If avatars are enabled, this field will be included and contain a url to retrieve the user's avatar..Example: https://en.gravatar.com/avatar/d8cb8c8cd40ddf0cd05241443a591868?s=80&r=g", null: true
          field :enrollments, [LMS::GraphQL::Types::Canvas::Enrollment], "Optional: This field can be requested with certain API calls, and will return a list of the users active enrollments. See the List enrollments API for more details about the format of these records..", null: true
          field :email, String, "Optional: This field can be requested with certain API calls, and will return the users primary email address..Example: sheldon@caltech.example.com", null: true
          field :locale, String, "Optional: This field can be requested with certain API calls, and will return the users locale in RFC 5646 format..Example: tlh", null: true
          field :last_login, String, "Optional: This field is only returned in certain API calls, and will return a timestamp representing the last time the user logged in to canvas..Example: 2012-05-30T17:45:25Z", null: true
          field :time_zone, String, "Optional: This field is only returned in certain API calls, and will return the IANA time zone name of the user's preferred timezone..Example: America/Denver", null: true
          field :bio, String, "Optional: The user's bio..Example: I like the Muppets.", null: true

        end
      end
    end
  end
end