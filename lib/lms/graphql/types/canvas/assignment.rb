require_relative "../canvas_base_type"
require_relative "assignment_date"
require_relative "turnitin_setting"
require_relative "external_tool_tag_attribute"
require_relative "needs_grading_count"
require_relative "lock_info"
require_relative "discussion_topic"
require_relative "submission"
require_relative "rubric_criterium"
require_relative "assignment_override"

module LMS
  module GraphQL
    module Types
      module Canvas
        class AssignmentSubmissionTypeEnum < ::GraphQL::Schema::Enum
          value "discussion_topic"
          value "online_quiz"
          value "on_paper"
          value "not_graded"
          value "none"
          value "external_tool"
          value "online_text_entry"
          value "online_url"
          value "online_upload"
          value "media_recording"
        end

                class AssignmentGradingTypeEnum < ::GraphQL::Schema::Enum
          value "pass_fail"
          value "percent"
          value "letter_grade"
          value "gpa_scale"
          value "points"
        end
        class Assignment < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :id, ID, "the ID of the assignment.Example: 4", null: true
          field :name, String, "the name of the assignment.Example: some assignment", null: true
          field :description, String, "the assignment description, in an HTML fragment.Example: <p>Do the following:</p>.", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "The time at which this assignment was originally created.Example: 2012-07-01T23:59:00-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "The time at which this assignment was last modified in any way.Example: 2012-07-01T23:59:00-06:00", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "the due date for the assignment. returns null if not present. NOTE: If this assignment has assignment overrides, this field will be the due date as it applies to the user requesting information from the API..Example: 2012-07-01T23:59:00-06:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "the lock date (assignment is locked after this date). returns null if not present. NOTE: If this assignment has assignment overrides, this field will be the lock date as it applies to the user requesting information from the API..Example: 2012-07-01T23:59:00-06:00", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "the unlock date (assignment is unlocked after this date) returns null if not present NOTE: If this assignment has assignment overrides, this field will be the unlock date as it applies to the user requesting information from the API..Example: 2012-07-01T23:59:00-06:00", null: true
          field :has_overrides, Boolean, "whether this assignment has overrides.Example: true", null: true
          field :all_dates, [LMS::GraphQL::Types::Canvas::AssignmentDate], "(Optional) all dates associated with the assignment, if applicable.", null: true
          field :course_id, ID, "the ID of the course the assignment belongs to.Example: 123", null: true
          field :html_url, String, "the URL to the assignment's web page.Example: https://.", null: true
          field :submissions_download_url, String, "the URL to download all submissions as a zip.Example: https://example.com/courses/:course_id/assignments/:id/submissions?zip=1", null: true
          field :assignment_group_id, ID, "the ID of the assignment's group.Example: 2", null: true
          field :due_date_required, Boolean, "Boolean flag indicating whether the assignment requires a due date based on the account level setting.Example: true", null: true
          field :allowed_extensions, String, "Allowed file extensions, which take effect if submission_types includes 'online_upload'..Example: docx, ppt", null: true
          field :max_name_length, Int, "An integer indicating the maximum length an assignment's name may be.Example: 15", null: true
          field :turnitin_enabled, Boolean, "Boolean flag indicating whether or not Turnitin has been enabled for the assignment. NOTE: This flag will not appear unless your account has the Turnitin plugin available.Example: true", null: true
          field :vericite_enabled, Boolean, "Boolean flag indicating whether or not VeriCite has been enabled for the assignment. NOTE: This flag will not appear unless your account has the VeriCite plugin available.Example: true", null: true
          field :turnitin_settings, LMS::GraphQL::Types::Canvas::TurnitinSetting, "Settings to pass along to turnitin to control what kinds of matches should be considered. originality_report_visibility can be 'immediate', 'after_grading', 'after_due_date', or 'never' exclude_small_matches_type can be null, 'percent', 'words' exclude_small_matches_value: - if type is null, this will be null also - if type is 'percent', this will be a number between 0 and 100 representing match size to exclude as a percentage of the document size. - if type is 'words', this will be number > 0 representing how many words a match must contain for it to be considered NOTE: This flag will not appear unless your account has the Turnitin plugin available.", null: true
          field :grade_group_students_individually, Boolean, "If this is a group assignment, boolean flag indicating whether or not students will be graded individually..", null: true
          field :external_tool_tag_attributes, LMS::GraphQL::Types::Canvas::ExternalToolTagAttribute, "(Optional) assignment's settings for external tools if submission_types include 'external_tool'. Only url and new_tab are included (new_tab defaults to false).  Use the 'External Tools' API if you need more information about an external tool..", null: true
          field :peer_reviews, Boolean, "Boolean indicating if peer reviews are required for this assignment.", null: true
          field :automatic_peer_reviews, Boolean, "Boolean indicating peer reviews are assigned automatically. If false, the teacher is expected to manually assign peer reviews..", null: true
          field :peer_review_count, Int, "Integer representing the amount of reviews each user is assigned. NOTE: This key is NOT present unless you have automatic_peer_reviews set to true..Example: 0", null: true
          field :peer_reviews_assign_at, LMS::GraphQL::Types::DateTimeType, "String representing a date the reviews are due by. Must be a date that occurs after the default due date. If blank, or date is not after the assignment's due date, the assignment's due date will be used. NOTE: This key is NOT present unless you have automatic_peer_reviews set to true..Example: 2012-07-01T23:59:00-06:00", null: true
          field :intra_group_peer_reviews, Boolean, "Boolean representing whether or not members from within the same group on a group assignment can be assigned to peer review their own group's work.Example: false", null: true
          field :group_category_id, ID, "The ID of the assignment’s group set, if this is a group assignment. For group discussions, set group_category_id on the discussion topic, not the linked assignment..Example: 1", null: true
          field :needs_grading_count, Int, "if the requesting user has grading rights, the number of submissions that need grading..Example: 17", null: true
          field :needs_grading_count_by_section, [LMS::GraphQL::Types::Canvas::NeedsGradingCount], "if the requesting user has grading rights and the 'needs_grading_count_by_section' flag is specified, the number of submissions that need grading split out by section. NOTE: This key is NOT present unless you pass the 'needs_grading_count_by_section' argument as true.  ANOTHER NOTE: it's possible to be enrolled in multiple sections, and if a student is setup that way they will show an assignment that needs grading in multiple sections (effectively the count will be duplicated between sections).Example: {'section_id'=>'123456', 'needs_grading_count'=>5}, {'section_id'=>'654321', 'needs_grading_count'=>0}", null: true
          field :position, Int, "the sorting order of the assignment in the group.Example: 1", null: true
          field :post_to_sis, Boolean, "(optional, present if Sync Grades to SIS feature is enabled).Example: true", null: true
          field :integration_id, ID, "(optional, Third Party unique identifier for Assignment).Example: 12341234", null: true
          field :integration_data, String, "(optional, Third Party integration data for assignment).Example: 12341234", null: true
          field :muted, Boolean, "whether the assignment is muted.", null: true
          field :points_possible, Int, "the maximum points possible for the assignment.Example: 12", null: true
          field :submission_types, AssignmentSubmissionTypeEnum, "the types of submissions allowed for this assignment list containing one or more of the following: 'discussion_topic', 'online_quiz', 'on_paper', 'none', 'external_tool', 'online_text_entry', 'online_url', 'online_upload' 'media_recording'.Example: online_text_entry", null: true
          field :has_submitted_submissions, Boolean, "If true, the assignment has been submitted to by at least one student.Example: true", null: true
          field :grading_type, AssignmentGradingTypeEnum, "The type of grading the assignment receives; one of 'pass_fail', 'percent', 'letter_grade', 'gpa_scale', 'points'.Example: points", null: true
          field :grading_standard_id, ID, "The id of the grading standard being applied to this assignment. Valid if grading_type is 'letter_grade' or 'gpa_scale'..", null: true
          field :published, Boolean, "Whether the assignment is published.Example: true", null: true
          field :unpublishable, Boolean, "Whether the assignment's 'published' state can be changed to false. Will be false if there are student submissions for the assignment..", null: true
          field :only_visible_to_overrides, Boolean, "Whether the assignment is only visible to overrides..", null: true
          field :locked_for_user, Boolean, "Whether or not this is locked for the user..", null: true
          field :lock_info, LMS::GraphQL::Types::Canvas::LockInfo, "(Optional) Information for the user about the lock. Present when locked_for_user is true..", null: true
          field :lock_explanation, String, "(Optional) An explanation of why this is locked for the user. Present when locked_for_user is true..Example: This assignment is locked until September 1 at 12:00am", null: true
          field :quiz_id, ID, "(Optional) id of the associated quiz (applies only when submission_types is ['online_quiz']).Example: 620", null: true
          field :anonymous_submissions, Boolean, "(Optional) whether anonymous submissions are accepted (applies only to quiz assignments).", null: true
          field :discussion_topic, LMS::GraphQL::Types::Canvas::DiscussionTopic, "(Optional) the DiscussionTopic associated with the assignment, if applicable.", null: true
          field :freeze_on_copy, Boolean, "(Optional) Boolean indicating if assignment will be frozen when it is copied. NOTE: This field will only be present if the AssignmentFreezer plugin is available for your account..", null: true
          field :frozen, Boolean, "(Optional) Boolean indicating if assignment is frozen for the calling user. NOTE: This field will only be present if the AssignmentFreezer plugin is available for your account..", null: true
          field :frozen_attributes, String, "(Optional) Array of frozen attributes for the assignment. Only account administrators currently have permission to change an attribute in this list. Will be empty if no attributes are frozen for this assignment. Possible frozen attributes are: title, description, lock_at, points_possible, grading_type, submission_types, assignment_group_id, allowed_extensions, group_category_id, notify_of_update, peer_reviews NOTE: This field will only be present if the AssignmentFreezer plugin is available for your account..Example: title", null: true
          field :submission, LMS::GraphQL::Types::Canvas::Submission, "(Optional) If 'submission' is included in the 'include' parameter, includes a Submission object that represents the current user's (user who is requesting information from the api) current submission for the assignment. See the Submissions API for an example response. If the user does not have a submission, this key will be absent..", null: true
          field :use_rubric_for_grading, Boolean, "(Optional) If true, the rubric is directly tied to grading the assignment. Otherwise, it is only advisory. Included if there is an associated rubric..Example: true", null: true
          field :rubric_settings, String, "(Optional) An object describing the basic attributes of the rubric, including the point total. Included if there is an associated rubric..Example: {'points_possible'=>12}", null: true
          field :rubric, [LMS::GraphQL::Types::Canvas::RubricCriterium], "(Optional) A list of scoring criteria and ratings for each rubric criterion. Included if there is an associated rubric..", null: true
          field :assignment_visibility, Int, "(Optional) If 'assignment_visibility' is included in the 'include' parameter, includes an array of student IDs who can see this assignment..Example: 137, 381, 572", null: true
          field :overrides, [LMS::GraphQL::Types::Canvas::AssignmentOverride], "(Optional) If 'overrides' is included in the 'include' parameter, includes an array of assignment override objects..", null: true
          field :omit_from_final_grade, Boolean, "(Optional) If true, the assignment will be omitted from the student's final grade.Example: true", null: true
          field :moderated_grading, Boolean, "Boolean indicating if the assignment is moderated..Example: true", null: true

        end
      end
    end
  end
end