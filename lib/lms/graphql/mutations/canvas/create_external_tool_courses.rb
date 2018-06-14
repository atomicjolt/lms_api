require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateExternalToolCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :name, String, required: true
          argument :privacy_level, String, required: true
          argument :consumer_key, String, required: true
          argument :shared_secret, String, required: true
          argument :description, String, required: false
          argument :url, String, required: false
          argument :domain, String, required: false
          argument :icon_url, String, required: false
          argument :text, String, required: false
          argument :custom_fields_field_name, String, required: false
          argument :account_navigation_url, String, required: false
          argument :account_navigation_enabled, Boolean, required: false
          argument :account_navigation_text, String, required: false
          argument :account_navigation_selection_width, String, required: false
          argument :account_navigation_selection_height, String, required: false
          argument :account_navigation_display_type, String, required: false
          argument :user_navigation_url, String, required: false
          argument :user_navigation_enabled, Boolean, required: false
          argument :user_navigation_text, String, required: false
          argument :user_navigation_visibility, String, required: false
          argument :course_home_sub_navigation_url, String, required: false
          argument :course_home_sub_navigation_enabled, Boolean, required: false
          argument :course_home_sub_navigation_text, String, required: false
          argument :course_home_sub_navigation_icon_url, String, required: false
          argument :course_navigation_enabled, Boolean, required: false
          argument :course_navigation_text, String, required: false
          argument :course_navigation_visibility, String, required: false
          argument :course_navigation_windowTarget, String, required: false
          argument :course_navigation_default, Boolean, required: false
          argument :course_navigation_display_type, String, required: false
          argument :editor_button_url, String, required: false
          argument :editor_button_enabled, Boolean, required: false
          argument :editor_button_icon_url, String, required: false
          argument :editor_button_selection_width, String, required: false
          argument :editor_button_selection_height, String, required: false
          argument :editor_button_message_type, String, required: false
          argument :homework_submission_url, String, required: false
          argument :homework_submission_enabled, Boolean, required: false
          argument :homework_submission_text, String, required: false
          argument :homework_submission_message_type, String, required: false
          argument :link_selection_url, String, required: false
          argument :link_selection_enabled, Boolean, required: false
          argument :link_selection_text, String, required: false
          argument :link_selection_message_type, String, required: false
          argument :migration_selection_url, String, required: false
          argument :migration_selection_enabled, Boolean, required: false
          argument :migration_selection_message_type, String, required: false
          argument :tool_configuration_url, String, required: false
          argument :tool_configuration_enabled, Boolean, required: false
          argument :tool_configuration_message_type, String, required: false
          argument :tool_configuration_prefer_sis_email, Boolean, required: false
          argument :resource_selection_url, String, required: false
          argument :resource_selection_enabled, Boolean, required: false
          argument :resource_selection_icon_url, String, required: false
          argument :resource_selection_selection_width, String, required: false
          argument :resource_selection_selection_height, String, required: false
          argument :config_type, String, required: false
          argument :config_xml, String, required: false
          argument :config_url, String, required: false
          argument :not_selectable, Boolean, required: false
          argument :oauth_compliant, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, name:, privacy_level:, consumer_key:, shared_secret:, description: nil, url: nil, domain: nil, icon_url: nil, text: nil, custom_fields_field_name: nil, account_navigation_url: nil, account_navigation_enabled: nil, account_navigation_text: nil, account_navigation_selection_width: nil, account_navigation_selection_height: nil, account_navigation_display_type: nil, user_navigation_url: nil, user_navigation_enabled: nil, user_navigation_text: nil, user_navigation_visibility: nil, course_home_sub_navigation_url: nil, course_home_sub_navigation_enabled: nil, course_home_sub_navigation_text: nil, course_home_sub_navigation_icon_url: nil, course_navigation_enabled: nil, course_navigation_text: nil, course_navigation_visibility: nil, course_navigation_windowTarget: nil, course_navigation_default: nil, course_navigation_display_type: nil, editor_button_url: nil, editor_button_enabled: nil, editor_button_icon_url: nil, editor_button_selection_width: nil, editor_button_selection_height: nil, editor_button_message_type: nil, homework_submission_url: nil, homework_submission_enabled: nil, homework_submission_text: nil, homework_submission_message_type: nil, link_selection_url: nil, link_selection_enabled: nil, link_selection_text: nil, link_selection_message_type: nil, migration_selection_url: nil, migration_selection_enabled: nil, migration_selection_message_type: nil, tool_configuration_url: nil, tool_configuration_enabled: nil, tool_configuration_message_type: nil, tool_configuration_prefer_sis_email: nil, resource_selection_url: nil, resource_selection_enabled: nil, resource_selection_icon_url: nil, resource_selection_selection_width: nil, resource_selection_selection_height: nil, config_type: nil, config_xml: nil, config_url: nil, not_selectable: nil, oauth_compliant: nil)
            ctx[:canvas_api].proxy(
              "CREATE_EXTERNAL_TOOL_COURSES",
              {
                "course_id": course_id,
                "name": name,
                "privacy_level": privacy_level,
                "consumer_key": consumer_key,
                "shared_secret": shared_secret,
                "description": description,
                "url": url,
                "domain": domain,
                "icon_url": icon_url,
                "text": text,
                "custom_fields[field_name]": custom_fields_field_name,
                "account_navigation[url]": account_navigation_url,
                "account_navigation[enabled]": account_navigation_enabled,
                "account_navigation[text]": account_navigation_text,
                "account_navigation[selection_width]": account_navigation_selection_width,
                "account_navigation[selection_height]": account_navigation_selection_height,
                "account_navigation[display_type]": account_navigation_display_type,
                "user_navigation[url]": user_navigation_url,
                "user_navigation[enabled]": user_navigation_enabled,
                "user_navigation[text]": user_navigation_text,
                "user_navigation[visibility]": user_navigation_visibility,
                "course_home_sub_navigation[url]": course_home_sub_navigation_url,
                "course_home_sub_navigation[enabled]": course_home_sub_navigation_enabled,
                "course_home_sub_navigation[text]": course_home_sub_navigation_text,
                "course_home_sub_navigation[icon_url]": course_home_sub_navigation_icon_url,
                "course_navigation[enabled]": course_navigation_enabled,
                "course_navigation[text]": course_navigation_text,
                "course_navigation[visibility]": course_navigation_visibility,
                "course_navigation[windowTarget]": course_navigation_windowTarget,
                "course_navigation[default]": course_navigation_default,
                "course_navigation[display_type]": course_navigation_display_type,
                "editor_button[url]": editor_button_url,
                "editor_button[enabled]": editor_button_enabled,
                "editor_button[icon_url]": editor_button_icon_url,
                "editor_button[selection_width]": editor_button_selection_width,
                "editor_button[selection_height]": editor_button_selection_height,
                "editor_button[message_type]": editor_button_message_type,
                "homework_submission[url]": homework_submission_url,
                "homework_submission[enabled]": homework_submission_enabled,
                "homework_submission[text]": homework_submission_text,
                "homework_submission[message_type]": homework_submission_message_type,
                "link_selection[url]": link_selection_url,
                "link_selection[enabled]": link_selection_enabled,
                "link_selection[text]": link_selection_text,
                "link_selection[message_type]": link_selection_message_type,
                "migration_selection[url]": migration_selection_url,
                "migration_selection[enabled]": migration_selection_enabled,
                "migration_selection[message_type]": migration_selection_message_type,
                "tool_configuration[url]": tool_configuration_url,
                "tool_configuration[enabled]": tool_configuration_enabled,
                "tool_configuration[message_type]": tool_configuration_message_type,
                "tool_configuration[prefer_sis_email]": tool_configuration_prefer_sis_email,
                "resource_selection[url]": resource_selection_url,
                "resource_selection[enabled]": resource_selection_enabled,
                "resource_selection[icon_url]": resource_selection_icon_url,
                "resource_selection[selection_width]": resource_selection_selection_width,
                "resource_selection[selection_height]": resource_selection_selection_height,
                "config_type": config_type,
                "config_xml": config_xml,
                "config_url": config_url,
                "not_selectable": not_selectable,
                "oauth_compliant": oauth_compliant              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end