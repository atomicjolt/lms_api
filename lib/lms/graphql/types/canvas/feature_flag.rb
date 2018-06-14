require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class FeatureFlagContextTypeEnum < ::GraphQL::Schema::Enum
          value "Course"
          value "Account"
          value "User"
        end

                class FeatureFlagStateEnum < ::GraphQL::Schema::Enum
          value "off"
          value "allowed"
          value "on"
        end
        class FeatureFlag < BaseType
          description "Feature Flags. API Docs: https://canvas.instructure.com/doc/api/feature_flags.html"
          field :context_type, FeatureFlagContextTypeEnum, "The type of object to which this flag applies (Account, Course, or User). (This field is not present if this FeatureFlag represents the global Canvas default).Example: Account", null: true
          field :context_id, ID, "The id of the object to which this flag applies (This field is not present if this FeatureFlag represents the global Canvas default).Example: 1038", null: true
          field :feature, String, "The feature this flag controls.Example: fancy_wickets", null: true
          field :state, FeatureFlagStateEnum, "The policy for the feature at this context.  can be 'off', 'allowed', or 'on'..Example: allowed", null: true
          field :locked, Boolean, "If set, this feature flag cannot be changed in the caller's context because the flag is set 'off' or 'on' in a higher context.", null: true

        end
      end
    end
  end
end