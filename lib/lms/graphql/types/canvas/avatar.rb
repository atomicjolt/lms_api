require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Avatar < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
          field :type, String, "['gravatar'|'attachment'|'no_pic'] The type of avatar record, for categorization purposes..Example: gravatar", null: true
          field :url, String, "The url of the avatar.Example: https://secure.gravatar.com/avatar/2284.", null: true
          field :token, String, "A unique representation of the avatar record which can be used to set the avatar with the user update endpoint. Note: this is an internal representation and is subject to change without notice. It should be consumed with this api endpoint and used in the user update endpoint, and should not be constructed by the client..Example: <opaque_token>", null: true
          field :display_name, String, "A textual description of the avatar record..Example: user, sample", null: true
          field :id, Int, "['attachment' type only] the internal id of the attachment.Example: 12", null: true
          field :content_type, String, "['attachment' type only] the content-type of the attachment..Example: image/jpeg", null: true
          field :filename, String, "['attachment' type only] the filename of the attachment.Example: profile.jpg", null: true
          field :size, Int, "['attachment' type only] the size of the attachment.Example: 32649", null: true

        end
      end
    end
  end
end