require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class SharedBrandConfig < BaseType
          description "Shared Brand Configs. API Docs: https://canvas.instructure.com/doc/api/shared_brand_configs.html"
          field :id, Int, "The shared_brand_config identifier..Example: 987", null: true
          field :account_id, String, "The id of the account it should be shared within..", null: true
          field :brand_config_md5, String, "The md5 (since BrandConfigs are identified by MD5 and not numeric id) of the BrandConfig to share..Example: 1d31002c95842f8fe16da7dfcc0d1f39", null: true
          field :name, String, "The name to share this theme as.Example: Crimson and Gold Verson 1", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "When this was created.Example: 2012-07-13T10:55:20-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "When this was last updated.Example: 2012-07-13T10:55:20-06:00", null: true

        end
      end
    end
  end
end