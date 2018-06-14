require_relative "../canvas_base_type"
require_relative "feature_flag"

module LMS
  module GraphQL
    module Types
      module Canvas
        class FeatureAppliesToEnum < ::GraphQL::Schema::Enum
          value "Course"
          value "RootAccount"
          value "Account"
          value "User"
        end
        class Feature < BaseType
          description "Feature Flags. API Docs: https://canvas.instructure.com/doc/api/feature_flags.html"
          field :name, String, "The symbolic name of the feature, used in FeatureFlags.Example: fancy_wickets", null: true
          field :display_name, String, "The user-visible name of the feature.Example: Fancy Wickets", null: true
          field :applies_to, FeatureAppliesToEnum, "The type of object the feature applies to (RootAccount, Account, Course, or User):
 * RootAccount features may only be controlled by flags on root accounts.
 * Account features may be controlled by flags on accounts and their parent accounts.
 * Course features may be controlled by flags on courses and their parent accounts.
 * User features may be controlled by flags on users and site admin only..Example: Course", null: true
          field :enable_at, LMS::GraphQL::Types::DateTimeType, "The date this feature will be globally enabled, or null if this is not planned. (This information is subject to change.).Example: 2014-01-01T00:00:00Z", null: true
          field :feature_flag, LMS::GraphQL::Types::Canvas::FeatureFlag, "The FeatureFlag that applies to the caller.Example: fancy_wickets, allowed", null: true
          field :root_opt_in, Boolean, "If true, a feature that is 'allowed' globally will be 'off' by default in root accounts. Otherwise, root accounts inherit the global 'allowed' setting, which allows sub-accounts and courses to turn features on with no root account action..Example: true", null: true
          field :beta, Boolean, "Whether the feature is a beta feature. If true, the feature may not be fully polished and may be subject to change in the future..Example: true", null: true
          field :autoexpand, Boolean, "Whether the details of the feature are autoexpanded on page load vs. the user clicking to expand..Example: true", null: true
          field :development, Boolean, "Whether the feature is in active development. Features in this state are only visible in test and beta instances and are not yet available for production use..", null: true
          field :release_notes_url, String, "A URL to the release notes describing the feature.Example: http://canvas.example.com/release_notes#fancy_wickets", null: true

        end
      end
    end
  end
end