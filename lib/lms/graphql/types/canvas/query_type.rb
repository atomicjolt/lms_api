require_relative "../../../utils"
require_relative "../canvas_base_type"
require_all(File.absolute_path(__FILE__), "../../resolvers/canvas/")

module LMS
  module GraphQL
    module Types
      module Canvas
        class QueryType < BaseType
          description "The root query of Canvas schema"
          field :search_account_domains,
            resolver: LMS::GraphQL::Resolvers::Canvas::SearchAccountDomain,
            description: "Search account domains. Returns a list of up to 5 matching account domains      Partial match on name / domain are supported"

          field :index_of_active_global_notification_for_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::IndexOfActiveGlobalNotificationForUser,
            description: "Index of active global notification for the user. Returns a list of all global notifications in the account for the current user   Any notifications that have been closed by the user will not be returned"

          field :show_global_notification,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowGlobalNotification,
            description: "Show a global notification. Returns a global notification for the current user   A notification that has been closed by the user will not be returned"

          field :list_available_reports,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAvailableReport,
            description: "List Available Reports. Returns a paginated list of reports for the current context."

          field :index_of_reports,
            resolver: LMS::GraphQL::Resolvers::Canvas::IndexOfReport,
            description: "Index of Reports. Shows all reports that have been run for the account of a specific type."

          field :status_of_report,
            resolver: LMS::GraphQL::Resolvers::Canvas::StatusOfReport,
            description: "Status of a Report. Returns the status of a report."

          field :list_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAccount,
            description: "List accounts. A paginated list of accounts that the current user can view or manage.   Typically, students and even teachers will get an empty list in response,   only account admins can view the accounts that they are in."

          field :list_accounts_for_course_admins,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAccountsForCourseAdmin,
            description: "List accounts for course admins. A paginated list of accounts that the current user can view through their   admin course enrollments. (Teacher, TA, or designer enrollments).   Only returns 'id', 'name', 'workflow_state', 'root_account_id' and 'parent_account_id'"

          field :get_single_account,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleAccount,
            description: "Get a single account. Retrieve information on an individual account, given by id or sis   sis_account_id."

          field :permissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::Permission,
            description: "Permissions. Returns permission information for the calling user and the given account.   You may use `self` as the account id to check permissions against the domain root account.   The caller must have an account role or admin (teacher/TA/designer) enrollment in a course   in the account. See also {api:CoursesController#permissions the Course counterpart}."

          field :get_sub_accounts_of_account,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSubAccountsOfAccount,
            description: "Get the sub-accounts of an account. List accounts that are sub-accounts of the given account."

          field :returns_terms_of_service_for_that_account,
            resolver: LMS::GraphQL::Resolvers::Canvas::ReturnsTermsOfServiceForThatAccount,
            description: "Returns the terms of service for that account. "

          field :list_active_courses_in_account,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListActiveCoursesInAccount,
            description: "List active courses in an account. Retrieve a paginated list of courses in this account."

          field :list_account_admins,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAccountAdmin,
            description: "List account admins. A paginated list of the admins in the account"

          field :get_department_level_participation_data_terms,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelParticipationDataTerm,
            description: "Get department-level participation data. Returns page view hits summed across all courses in the department. Two   groupings of these counts are returned; one by day (+by_date+), the other   by category (+by_category+). The possible categories are announcements,   assignments, collaborations, conferences, discussions, files, general,   grades, groups, modules, other, pages, and quizzes.      This and the other department-level endpoints have three variations which   all return the same style of data but for different subsets of courses. All   share the prefix /api/v1/accounts/<account_id>/analytics. The possible   suffixes are:       * /current: includes all available courses in the default term    * /completed: includes all concluded courses in the default term    * /terms/<term_id>: includes all available or concluded courses in the      given term.      Courses not yet offered or which have been deleted are never included.      /current and /completed are intended for use when the account has only one   term. /terms/<term_id> is intended for use when the account has multiple   terms.      The action follows the suffix."

          field :get_department_level_participation_data_current,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelParticipationDataCurrent,
            description: "Get department-level participation data. Returns page view hits summed across all courses in the department. Two   groupings of these counts are returned; one by day (+by_date+), the other   by category (+by_category+). The possible categories are announcements,   assignments, collaborations, conferences, discussions, files, general,   grades, groups, modules, other, pages, and quizzes.      This and the other department-level endpoints have three variations which   all return the same style of data but for different subsets of courses. All   share the prefix /api/v1/accounts/<account_id>/analytics. The possible   suffixes are:       * /current: includes all available courses in the default term    * /completed: includes all concluded courses in the default term    * /terms/<term_id>: includes all available or concluded courses in the      given term.      Courses not yet offered or which have been deleted are never included.      /current and /completed are intended for use when the account has only one   term. /terms/<term_id> is intended for use when the account has multiple   terms.      The action follows the suffix."

          field :get_department_level_participation_data_completed,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelParticipationDataCompleted,
            description: "Get department-level participation data. Returns page view hits summed across all courses in the department. Two   groupings of these counts are returned; one by day (+by_date+), the other   by category (+by_category+). The possible categories are announcements,   assignments, collaborations, conferences, discussions, files, general,   grades, groups, modules, other, pages, and quizzes.      This and the other department-level endpoints have three variations which   all return the same style of data but for different subsets of courses. All   share the prefix /api/v1/accounts/<account_id>/analytics. The possible   suffixes are:       * /current: includes all available courses in the default term    * /completed: includes all concluded courses in the default term    * /terms/<term_id>: includes all available or concluded courses in the      given term.      Courses not yet offered or which have been deleted are never included.      /current and /completed are intended for use when the account has only one   term. /terms/<term_id> is intended for use when the account has multiple   terms.      The action follows the suffix."

          field :get_department_level_grade_data_terms,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelGradeDataTerm,
            description: "Get department-level grade data. Returns the distribution of grades for students in courses in the   department.  Each data point is one student's current grade in one course;   if a student is in multiple courses, he contributes one value per course,   but if he's enrolled multiple times in the same course (e.g. a lecture   section and a lab section), he only constributes on value for that course.      Grades are binned to the nearest integer score; anomalous grades outside   the 0 to 100 range are ignored. The raw counts are returned, not yet   normalized by the total count.      Shares the same variations on endpoint as the participation data."

          field :get_department_level_grade_data_current,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelGradeDataCurrent,
            description: "Get department-level grade data. Returns the distribution of grades for students in courses in the   department.  Each data point is one student's current grade in one course;   if a student is in multiple courses, he contributes one value per course,   but if he's enrolled multiple times in the same course (e.g. a lecture   section and a lab section), he only constributes on value for that course.      Grades are binned to the nearest integer score; anomalous grades outside   the 0 to 100 range are ignored. The raw counts are returned, not yet   normalized by the total count.      Shares the same variations on endpoint as the participation data."

          field :get_department_level_grade_data_completed,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelGradeDataCompleted,
            description: "Get department-level grade data. Returns the distribution of grades for students in courses in the   department.  Each data point is one student's current grade in one course;   if a student is in multiple courses, he contributes one value per course,   but if he's enrolled multiple times in the same course (e.g. a lecture   section and a lab section), he only constributes on value for that course.      Grades are binned to the nearest integer score; anomalous grades outside   the 0 to 100 range are ignored. The raw counts are returned, not yet   normalized by the total count.      Shares the same variations on endpoint as the participation data."

          field :get_department_level_statistics_terms,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsTerm,
            description: "Get department-level statistics. Returns numeric statistics about the department and term (or filter).      Shares the same variations on endpoint as the participation data."

          field :get_department_level_statistics_current,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsCurrent,
            description: "Get department-level statistics. Returns numeric statistics about the department and term (or filter).      Shares the same variations on endpoint as the participation data."

          field :get_department_level_statistics_completed,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDepartmentLevelStatisticsCompleted,
            description: "Get department-level statistics. Returns numeric statistics about the department and term (or filter).      Shares the same variations on endpoint as the participation data."

          field :get_course_level_participation_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseLevelParticipationDatum,
            description: "Get course-level participation data. Returns page view hits and participation numbers grouped by day through the   entire history of the course. Page views is returned as a hash, where the   hash keys are dates in the format 'YYYY-MM-DD'. The page_views result set   includes page views broken out by access category. Participations is   returned as an array of dates in the format 'YYYY-MM-DD'."

          field :get_course_level_assignment_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseLevelAssignmentDatum,
            description: "Get course-level assignment data. Returns a list of assignments for the course sorted by due date. For   each assignment returns basic assignment information, the grade breakdown,   and a breakdown of on-time/late status of homework submissions."

          field :get_course_level_student_summary_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseLevelStudentSummaryDatum,
            description: "Get course-level student summary data. Returns a summary of per-user access information for all students in   a course. This includes total page views, total participations, and a   breakdown of on-time/late status for all homework submissions in the course.      Each student's summary also includes the maximum number of page views and   participations by any student in the course, which may be useful for some   visualizations (since determining maximums client side can be tricky with   pagination)."

          field :get_user_in_a_course_level_participation_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetUserInACourseLevelParticipationDatum,
            description: "Get user-in-a-course-level participation data. Returns page view hits grouped by hour, and participation details through the   entire history of the course.      `page_views` are returned as a hash, where the keys are iso8601 dates, bucketed by the hour.   `participations` are returned as an array of hashes, sorted oldest to newest."

          field :get_user_in_a_course_level_assignment_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetUserInACourseLevelAssignmentDatum,
            description: "Get user-in-a-course-level assignment data. Returns a list of assignments for the course sorted by due date. For   each assignment returns basic assignment information, the grade breakdown   (including the student's actual grade), and the basic submission   information for the student's submission if it exists."

          field :get_user_in_a_course_level_messaging_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetUserInACourseLevelMessagingDatum,
            description: "Get user-in-a-course-level messaging data. Returns messaging 'hits' grouped by day through the entire history of the   course. Returns a hash containing the number of instructor-to-student messages,   and student-to-instructor messages, where the hash keys are dates   in the format 'YYYY-MM-DD'. Message hits include Conversation messages and   comments on homework submissions."

          field :list_external_feeds_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListExternalFeedsCourse,
            description: "List external feeds. Returns the paginated list of External Feeds this course or group."

          field :list_external_feeds_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListExternalFeedsGroup,
            description: "List external feeds. Returns the paginated list of External Feeds this course or group."

          field :list_announcements,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAnnouncement,
            description: "List announcements. Returns the paginated list of announcements for the given courses and date range.  Note that   a +context_code+ field is added to the responses so you can tell which course each announcement   belongs to."

          field :list_appointment_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAppointmentGroup,
            description: "List appointment groups. Retrieve the paginated list of appointment groups that can be reserved or   managed by the current user."

          field :get_single_appointment_group,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleAppointmentGroup,
            description: "Get a single appointment group. Returns information for a single appointment group"

          field :list_user_participants,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUserParticipant,
            description: "List user participants. A paginated list of users that are (or may be) participating in this   appointment group.  Refer to the Users API for the response fields. Returns   no results for appointment groups with the 'Group' participant_type."

          field :list_student_group_participants,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListStudentGroupParticipant,
            description: "List student group participants. A paginated list of student groups that are (or may be) participating in   this appointment group. Refer to the Groups API for the response fields.   Returns no results for appointment groups with the 'User' participant_type."

          field :get_next_appointment,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetNextAppointment,
            description: "Get next appointment. Return the next appointment available to sign up for. The appointment   is returned in a one-element array. If no future appointments are   available, an empty array is returned."

          field :list_assignment_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAssignmentGroup,
            description: "List assignment groups. Returns the paginated list of assignment groups for the current context.   The returned groups are sorted by their position field."

          field :get_assignment_group,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAssignmentGroup,
            description: "Get an Assignment Group. Returns the assignment group with the given id."

          field :list_assignments,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAssignment,
            description: "List assignments. Returns the paginated list of assignments for the current context."

          field :list_assignments_for_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAssignmentsForUser,
            description: "List assignments for user. Returns the paginated list of assignments for the specified user if the current user has rights to view.   See {api:AssignmentsApiController#index List assignments} for valid arguments."

          field :get_single_assignment,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleAssignment,
            description: "Get a single assignment. Returns the assignment with the given id.    'observed_users' is passed, submissions for observed users will also be included."

          field :list_assignment_overrides,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAssignmentOverride,
            description: "List assignment overrides. Returns the paginated list of overrides for this assignment that target   sections/groups/students visible to the current user."

          field :get_single_assignment_override,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleAssignmentOverride,
            description: "Get a single assignment override. Returns details of the the override with the given id."

          field :redirect_to_assignment_override_for_group,
            resolver: LMS::GraphQL::Resolvers::Canvas::RedirectToAssignmentOverrideForGroup,
            description: "Redirect to the assignment override for a group. Responds with a redirect to the override for the given group, if any   (404 otherwise)."

          field :redirect_to_assignment_override_for_section,
            resolver: LMS::GraphQL::Resolvers::Canvas::RedirectToAssignmentOverrideForSection,
            description: "Redirect to the assignment override for a section. Responds with a redirect to the override for the given section, if any   (404 otherwise)."

          field :batch_retrieve_overrides_in_course,
            resolver: LMS::GraphQL::Resolvers::Canvas::BatchRetrieveOverridesInCourse,
            description: "Batch retrieve overrides in a course. Returns a list of specified overrides in this course, providing   they target sections/groups/students visible to the current user.   Returns null elements in the list for requests that were not found."

          field :list_authentication_providers,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAuthenticationProvider,
            description: "List authentication providers. Returns a paginated list of authentication providers"

          field :get_authentication_provider,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAuthenticationProvider,
            description: "Get authentication provider. Get the specified authentication provider"

          field :show_account_auth_settings,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowAccountAuthSetting,
            description: "show account auth settings. The way to get the current state of each account level setting   that's relevant to Single Sign On configuration      You can list the current state of each setting with 'update_sso_settings'"

          field :query_by_login,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryByLogin,
            description: "Query by login.. List authentication events for a given login."

          field :query_by_account,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryByAccount,
            description: "Query by account.. List authentication events for a given account."

          field :query_by_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryByUser,
            description: "Query by user.. List authentication events for a given user."

          field :get_blueprint_information,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetBlueprintInformation,
            description: "Get blueprint information. Using 'default' as the template_id should suffice for the current implmentation (as there should be only one template per course).   However, using specific template ids may become necessary in the future"

          field :get_associated_course_information,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAssociatedCourseInformation,
            description: "Get associated course information. Returns a list of courses that are configured to receive updates from this blueprint"

          field :get_unsynced_changes,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetUnsyncedChange,
            description: "Get unsynced changes. Retrieve a list of learning objects that have changed since the last blueprint sync operation."

          field :list_blueprint_migrations,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListBlueprintMigration,
            description: "List blueprint migrations. Shows a paginated list of migrations for the template, starting with the most recent. This endpoint can be called on a   blueprint course. See also {api:MasterCourses::MasterTemplatesController#imports_index the associated course side}."

          field :show_blueprint_migration,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowBlueprintMigration,
            description: "Show a blueprint migration. Shows the status of a migration. This endpoint can be called on a blueprint course. See also   {api:MasterCourses::MasterTemplatesController#imports_show the associated course side}."

          field :get_migration_details,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetMigrationDetail,
            description: "Get migration details. Show the changes that were propagated in a blueprint migration. This endpoint can be called on a   blueprint course. See also {api:MasterCourses::MasterTemplatesController#import_details the associated course side}."

          field :list_blueprint_imports,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListBlueprintImport,
            description: "List blueprint imports. Shows a paginated list of migrations imported into a course associated with a blueprint, starting with the most recent. See also   {api:MasterCourses::MasterTemplatesController#migrations_index the blueprint course side}.      Use 'default' as the subscription_id to use the currently active blueprint subscription."

          field :show_blueprint_import,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowBlueprintImport,
            description: "Show a blueprint import. Shows the status of an import into a course associated with a blueprint. See also   {api:MasterCourses::MasterTemplatesController#migrations_show the blueprint course side}."

          field :get_import_details,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetImportDetail,
            description: "Get import details. Show the changes that were propagated to a course associated with a blueprint.  See also   {api:MasterCourses::MasterTemplatesController#migration_details the blueprint course side}."

          field :list_bookmarks,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListBookmark,
            description: "List bookmarks. Returns the paginated list of bookmarks."

          field :get_bookmark,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetBookmark,
            description: "Get bookmark. Returns the details for a bookmark."

          field :get_brand_config_variables_that_should_be_used_for_this_domain,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetBrandConfigVariablesThatShouldBeUsedForThisDomain,
            description: "Get the brand config variables that should be used for this domain. Will redirect to a static json file that has all of the brand   variables used by this account. Even though this is a redirect,   do not store the redirected url since if the account makes any changes   it will redirect to a new url. Needs no authentication."

          field :list_calendar_events,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCalendarEvent,
            description: "List calendar events. Retrieve the paginated list of calendar events or assignments for the current user"

          field :list_calendar_events_for_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCalendarEventsForUser,
            description: "List calendar events for a user. Retrieve the paginated list of calendar events or assignments for the specified user.   To view calendar events for a user other than yourself,   you must either be an observer of that user or an administrator."

          field :get_single_calendar_event_or_assignment,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleCalendarEventOrAssignment,
            description: "Get a single calendar event or assignment. "

          field :get_course_timetable,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseTimetable,
            description: "Get course timetable. Returns the last timetable set by the   {api:CalendarEventsApiController#set_course_timetable Set a course timetable} endpoint"

          field :list_collaborations_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCollaborationsCourse,
            description: "List collaborations. A paginated list of collaborations the current user has access to in the   context of the course provided in the url. NOTE: this only returns   ExternalToolCollaboration type collaborations.        curl https: <canvas>/api/v1/courses/1/collaborations/"

          field :list_collaborations_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCollaborationsGroup,
            description: "List collaborations. A paginated list of collaborations the current user has access to in the   context of the course provided in the url. NOTE: this only returns   ExternalToolCollaboration type collaborations.        curl https: <canvas>/api/v1/courses/1/collaborations/"

          field :list_members_of_collaboration,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMembersOfCollaboration,
            description: "List members of a collaboration.. A paginated list of the collaborators of a given collaboration"

          field :list_potential_members_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPotentialMembersCourse,
            description: "List potential members. A paginated list of the users who can potentially be added to a   collaboration in the given context.      For courses, this consists of all enrolled users.  For groups, it is comprised of the   group members plus the admins of the course containing the group."

          field :list_potential_members_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPotentialMembersGroup,
            description: "List potential members. A paginated list of the users who can potentially be added to a   collaboration in the given context.      For courses, this consists of all enrolled users.  For groups, it is comprised of the   group members plus the admins of the course containing the group."

          field :list_of_commmessages_for_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListOfCommmessagesForUser,
            description: "List of CommMessages for a user. Retrieve a paginated list of messages sent to a user."

          field :list_user_communication_channels,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUserCommunicationChannel,
            description: "List user communication channels. Returns a paginated list of communication channels for the specified user,   sorted by position."

          field :list_conferences_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListConferencesCourse,
            description: "List conferences. Retrieve the paginated list of conferences for this context      This API returns a JSON object containing the list of conferences,   the key for the list of conferences is 'conferences'"

          field :list_conferences_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListConferencesGroup,
            description: "List conferences. Retrieve the paginated list of conferences for this context      This API returns a JSON object containing the list of conferences,   the key for the list of conferences is 'conferences'"

          field :list_content_exports_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentExportsCourse,
            description: "List content exports. A paginated list of the past and pending content export jobs for a course,   group, or user. Exports are returned newest first."

          field :list_content_exports_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentExportsGroup,
            description: "List content exports. A paginated list of the past and pending content export jobs for a course,   group, or user. Exports are returned newest first."

          field :list_content_exports_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentExportsUser,
            description: "List content exports. A paginated list of the past and pending content export jobs for a course,   group, or user. Exports are returned newest first."

          field :show_content_export_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowContentExportCourse,
            description: "Show content export. Get information about a single content export."

          field :show_content_export_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowContentExportGroup,
            description: "Show content export. Get information about a single content export."

          field :show_content_export_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowContentExportUser,
            description: "Show content export. Get information about a single content export."

          field :list_migration_issues_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationIssuesAccount,
            description: "List migration issues. Returns paginated migration issues"

          field :list_migration_issues_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationIssuesCourse,
            description: "List migration issues. Returns paginated migration issues"

          field :list_migration_issues_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationIssuesGroup,
            description: "List migration issues. Returns paginated migration issues"

          field :list_migration_issues_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationIssuesUser,
            description: "List migration issues. Returns paginated migration issues"

          field :get_migration_issue_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetMigrationIssueAccount,
            description: "Get a migration issue. Returns data on an individual migration issue"

          field :get_migration_issue_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetMigrationIssueCourse,
            description: "Get a migration issue. Returns data on an individual migration issue"

          field :get_migration_issue_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetMigrationIssueGroup,
            description: "Get a migration issue. Returns data on an individual migration issue"

          field :get_migration_issue_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetMigrationIssueUser,
            description: "Get a migration issue. Returns data on an individual migration issue"

          field :list_content_migrations_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentMigrationsAccount,
            description: "List content migrations. Returns paginated content migrations"

          field :list_content_migrations_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentMigrationsCourse,
            description: "List content migrations. Returns paginated content migrations"

          field :list_content_migrations_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentMigrationsGroup,
            description: "List content migrations. Returns paginated content migrations"

          field :list_content_migrations_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListContentMigrationsUser,
            description: "List content migrations. Returns paginated content migrations"

          field :get_content_migration_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetContentMigrationAccount,
            description: "Get a content migration. Returns data on an individual content migration"

          field :get_content_migration_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetContentMigrationCourse,
            description: "Get a content migration. Returns data on an individual content migration"

          field :get_content_migration_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetContentMigrationGroup,
            description: "Get a content migration. Returns data on an individual content migration"

          field :get_content_migration_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetContentMigrationUser,
            description: "Get a content migration. Returns data on an individual content migration"

          field :list_migration_systems_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationSystemsAccount,
            description: "List Migration Systems. Lists the currently available migration types. These values may change."

          field :list_migration_systems_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationSystemsCourse,
            description: "List Migration Systems. Lists the currently available migration types. These values may change."

          field :list_migration_systems_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationSystemsGroup,
            description: "List Migration Systems. Lists the currently available migration types. These values may change."

          field :list_migration_systems_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMigrationSystemsUser,
            description: "List Migration Systems. Lists the currently available migration types. These values may change."

          field :list_conversations,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListConversation,
            description: "List conversations. Returns the paginated list of conversations for the current user, most   recent ones first."

          field :get_running_batches,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetRunningBatch,
            description: "Get running batches. Returns any currently running conversation batches for the current user.   Conversation batches are created when a bulk private message is sent   asynchronously (see the mode argument to the {api:ConversationsController#create create API action})."

          field :get_single_conversation,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleConversation,
            description: "Get a single conversation. Returns information for a single conversation for the current user. Response includes all   fields that are present in the list/index action as well as messages   and extended participant information."

          field :find_recipients,
            resolver: LMS::GraphQL::Resolvers::Canvas::FindRecipient,
            description: "Find recipients. Deprecated, see the {api:SearchController#recipients Find recipients endpoint} in the Search API"

          field :unread_count,
            resolver: LMS::GraphQL::Resolvers::Canvas::UnreadCount,
            description: "Unread count. Get the number of unread conversations for the current user"

          field :course_audit_log_query_by_course,
            resolver: LMS::GraphQL::Resolvers::Canvas::CourseAuditLogQueryByCourse,
            description: "Query by course.. List course change events for a given course."

          field :list_your_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListYourCourse,
            description: "List your courses. Returns the paginated list of active courses for the current user."

          field :list_courses_for_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCoursesForUser,
            description: "List courses for a user. Returns a paginated list of active courses for this user. To view the course list for a user other than yourself, you must be either an observer of that user or an administrator."

          field :list_students,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListStudent,
            description: "List students. Returns the paginated list of students enrolled in this course.      DEPRECATED: Please use the {api:CoursesController#users course users} endpoint   and pass 'student' as the enrollment_type."

          field :list_users_in_course_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUsersInCourseUser,
            description: "List users in course. Returns the paginated list of users in this course. And optionally the user's enrollments in the course."

          field :list_users_in_course_search_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUsersInCourseSearchUser,
            description: "List users in course. Returns the paginated list of users in this course. And optionally the user's enrollments in the course."

          field :list_recently_logged_in_students,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListRecentlyLoggedInStudent,
            description: "List recently logged in students. Returns the paginated list of users in this course, ordered by how recently they have   logged in. The records include the 'last_login' field which contains   a timestamp of the last time that user logged into canvas.  The querying   user must have the 'View usage reports' permission."

          field :get_single_user,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleUser,
            description: "Get single user. Return information on a single user.      Accepts the same include[] parameters as the :users: action, and returns a   single user with the same fields as that action."

          field :course_activity_stream,
            resolver: LMS::GraphQL::Resolvers::Canvas::CourseActivityStream,
            description: "Course activity stream. Returns the current user's course-specific activity stream, paginated.      For full documentation, see the API documentation for the user activity   stream, in the user api."

          field :course_activity_stream_summary,
            resolver: LMS::GraphQL::Resolvers::Canvas::CourseActivityStreamSummary,
            description: "Course activity stream summary. Returns a summary of the current user's course-specific activity stream.      For full documentation, see the API documentation for the user activity   stream summary, in the user api."

          field :course_todo_items,
            resolver: LMS::GraphQL::Resolvers::Canvas::CourseTodoItem,
            description: "Course TODO items. Returns the current user's course-specific todo items.      For full documentation, see the API documentation for the user todo items, in the user api."

          field :get_course_settings,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseSetting,
            description: "Get course settings. Returns some of a course's settings."

          field :get_single_course_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleCourseCourse,
            description: "Get a single course. Return information on a single course.      Accepts the same include[] parameters as the list action plus:"

          field :get_single_course_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleCourseAccount,
            description: "Get a single course. Return information on a single course.      Accepts the same include[] parameters as the list action plus:"

          field :get_effective_due_dates,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetEffectiveDueDate,
            description: "Get effective due dates. For each assignment in the course, returns each assigned student's ID   and their corresponding due date along with some grading period data.   Returns a collection with keys representing assignment IDs and values as a   collection containing keys representing student IDs and values representing   the student's effective due_at, the grading_period_id of which the due_at falls   in, and whether or not the grading period is closed (in_closed_grading_period)      The list of assignment IDs for which effective student due dates are   requested. If not provided, all assignments in the course will be used."

          field :permissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::Permission,
            description: "Permissions. Returns permission information for the calling user in the given course.   See also {api:AccountsController#permissions the Account counterpart}."

          field :get_course_copy_status,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseCopyStatus,
            description: "Get course copy status. DEPRECATED: Please use the {api:ContentMigrationsController#create Content Migrations API}      Retrieve the status of a course copy"

          field :list_custom_gradebook_columns,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCustomGradebookColumn,
            description: "List custom gradebook columns. A paginated list of all custom gradebook columns for a course"

          field :list_entries_for_column,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEntriesForColumn,
            description: "List entries for a column. This does not list entries for students without associated data."

          field :list_discussion_topics_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListDiscussionTopicsCourse,
            description: "List discussion topics. Returns the paginated list of discussion topics for this course or group."

          field :list_discussion_topics_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListDiscussionTopicsGroup,
            description: "List discussion topics. Returns the paginated list of discussion topics for this course or group."

          field :get_single_topic_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleTopicCourse,
            description: "Get a single topic. Returns data on an individual discussion topic. See the List action for the response formatting."

          field :get_single_topic_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleTopicGroup,
            description: "Get a single topic. Returns data on an individual discussion topic. See the List action for the response formatting."

          field :get_full_topic_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFullTopicCourse,
            description: "Get the full topic. Return a cached structure of the discussion topic, containing all entries,   their authors, and their message bodies.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      In some rare situations, this cached structure may not be available yet. In   that case, the server will respond with a 503 error, and the caller should   try again soon.      The response is an object containing the following keys:   * 'participants': A list of summary information on users who have posted to     the discussion. Each value is an object containing their id, display_name,     and avatar_url.   * 'unread_entries': A list of entry ids that are unread by the current     user. this implies that any entry not in this list is read.   * 'entry_ratings': A map of entry ids to ratings by the current user. Entries     not in this list have no rating. Only populated if rating is enabled.   * 'forced_entries': A list of entry ids that have forced_read_state set to     true. This flag is meant to indicate the entry's read_state has been     manually set to 'unread' by the user, so the entry should not be     automatically marked as read.   * 'view': A threaded view of all the entries in the discussion, containing     the id, user_id, and message.   * 'new_entries': Because this view is eventually consistent, it's possible     that newly created or updated entries won't yet be reflected in the view.     If the application wants to also get a flat list of all entries not yet     reflected in the view, pass include_new_entries=1 to the request and this     array of entries will be returned. These entries are returned in a flat     array, in ascending created_at order."

          field :get_full_topic_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFullTopicGroup,
            description: "Get the full topic. Return a cached structure of the discussion topic, containing all entries,   their authors, and their message bodies.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      In some rare situations, this cached structure may not be available yet. In   that case, the server will respond with a 503 error, and the caller should   try again soon.      The response is an object containing the following keys:   * 'participants': A list of summary information on users who have posted to     the discussion. Each value is an object containing their id, display_name,     and avatar_url.   * 'unread_entries': A list of entry ids that are unread by the current     user. this implies that any entry not in this list is read.   * 'entry_ratings': A map of entry ids to ratings by the current user. Entries     not in this list have no rating. Only populated if rating is enabled.   * 'forced_entries': A list of entry ids that have forced_read_state set to     true. This flag is meant to indicate the entry's read_state has been     manually set to 'unread' by the user, so the entry should not be     automatically marked as read.   * 'view': A threaded view of all the entries in the discussion, containing     the id, user_id, and message.   * 'new_entries': Because this view is eventually consistent, it's possible     that newly created or updated entries won't yet be reflected in the view.     If the application wants to also get a flat list of all entries not yet     reflected in the view, pass include_new_entries=1 to the request and this     array of entries will be returned. These entries are returned in a flat     array, in ascending created_at order."

          field :list_topic_entries_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListTopicEntriesCourse,
            description: "List topic entries. Retrieve the (paginated) top-level entries in a discussion topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Will include the 10 most recent replies, if any, for each entry returned.      If the topic is a root topic with children corresponding to groups of a   group assignment, entries from those subtopics for which the user belongs   to the corresponding group will be returned.      Ordering of returned entries is newest-first by posting timestamp (reply   activity is ignored)."

          field :list_topic_entries_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListTopicEntriesGroup,
            description: "List topic entries. Retrieve the (paginated) top-level entries in a discussion topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Will include the 10 most recent replies, if any, for each entry returned.      If the topic is a root topic with children corresponding to groups of a   group assignment, entries from those subtopics for which the user belongs   to the corresponding group will be returned.      Ordering of returned entries is newest-first by posting timestamp (reply   activity is ignored)."

          field :list_entry_replies_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEntryRepliesCourse,
            description: "List entry replies. Retrieve the (paginated) replies to a top-level entry in a discussion   topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Ordering of returned entries is newest-first by creation timestamp."

          field :list_entry_replies_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEntryRepliesGroup,
            description: "List entry replies. Retrieve the (paginated) replies to a top-level entry in a discussion   topic.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'.      Ordering of returned entries is newest-first by creation timestamp."

          field :list_entries_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEntriesCourse,
            description: "List entries. Retrieve a paginated list of discussion entries, given a list of ids.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'."

          field :list_entries_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEntriesGroup,
            description: "List entries. Retrieve a paginated list of discussion entries, given a list of ids.      May require (depending on the topic) that the user has posted in the topic.   If it is required, and the user has not posted, will respond with a 403   Forbidden status and the body 'require_initial_post'."

          field :list_enrollment_terms,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnrollmentTerm,
            description: "List enrollment terms. A paginated list of all of the terms in the account."

          field :list_enrollments_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnrollmentsCourse,
            description: "List enrollments. Depending on the URL given, return a paginated list of either (1) all of   the enrollments in a course, (2) all of the enrollments in a section or (3)   all of a user's enrollments. This includes student, teacher, TA, and   observer enrollments.      If a user has multiple enrollments in a context (e.g. as a teacher   and a student or in multiple course sections), each enrollment will be   listed separately.      note: Currently, only a root level admin user can return other users' enrollments. A   user can, however, return his/her own enrollments."

          field :list_enrollments_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnrollmentsSection,
            description: "List enrollments. Depending on the URL given, return a paginated list of either (1) all of   the enrollments in a course, (2) all of the enrollments in a section or (3)   all of a user's enrollments. This includes student, teacher, TA, and   observer enrollments.      If a user has multiple enrollments in a context (e.g. as a teacher   and a student or in multiple course sections), each enrollment will be   listed separately.      note: Currently, only a root level admin user can return other users' enrollments. A   user can, however, return his/her own enrollments."

          field :list_enrollments_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnrollmentsUser,
            description: "List enrollments. Depending on the URL given, return a paginated list of either (1) all of   the enrollments in a course, (2) all of the enrollments in a section or (3)   all of a user's enrollments. This includes student, teacher, TA, and   observer enrollments.      If a user has multiple enrollments in a context (e.g. as a teacher   and a student or in multiple course sections), each enrollment will be   listed separately.      note: Currently, only a root level admin user can return other users' enrollments. A   user can, however, return his/her own enrollments."

          field :enrollment_by_id,
            resolver: LMS::GraphQL::Resolvers::Canvas::EnrollmentById,
            description: "Enrollment by ID. Get an Enrollment object by Enrollment ID"

          field :list_external_tools_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListExternalToolsCourse,
            description: "List external tools. Returns the paginated list of external tools for the current context.   See the get request docs for a single tool for a list of properties on an external tool."

          field :list_external_tools_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListExternalToolsAccount,
            description: "List external tools. Returns the paginated list of external tools for the current context.   See the get request docs for a single tool for a list of properties on an external tool."

          field :list_external_tools_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListExternalToolsGroup,
            description: "List external tools. Returns the paginated list of external tools for the current context.   See the get request docs for a single tool for a list of properties on an external tool."

          field :get_sessionless_launch_url_for_external_tool_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSessionlessLaunchUrlForExternalToolCourse,
            description: "Get a sessionless launch url for an external tool.. Returns a sessionless launch url for an external tool.      NOTE: Either the id or url must be provided unless launch_type is assessment or module_item."

          field :get_sessionless_launch_url_for_external_tool_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSessionlessLaunchUrlForExternalToolAccount,
            description: "Get a sessionless launch url for an external tool.. Returns a sessionless launch url for an external tool.      NOTE: Either the id or url must be provided unless launch_type is assessment or module_item."

          field :get_single_external_tool_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleExternalToolCourse,
            description: "Get a single external tool. Returns the specified external tool."

          field :get_single_external_tool_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleExternalToolAccount,
            description: "Get a single external tool. Returns the specified external tool."

          field :list_favorite_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFavoriteCourse,
            description: "List favorite courses. Retrieve the paginated list of favorite courses for the current user. If the user has not chosen   any favorites, then a selection of currently enrolled courses will be returned.      See the {api:CoursesController#index List courses API} for details on accepted include[] parameters."

          field :list_favorite_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFavoriteGroup,
            description: "List favorite groups. Retrieve the paginated list of favorite groups for the current user. If the user has not chosen   any favorites, then a selection of groups that the user is a member of will be returned."

          field :list_features_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFeaturesCourse,
            description: "List features. A paginated list of all features that apply to a given Account, Course, or User."

          field :list_features_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFeaturesAccount,
            description: "List features. A paginated list of all features that apply to a given Account, Course, or User."

          field :list_features_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFeaturesUser,
            description: "List features. A paginated list of all features that apply to a given Account, Course, or User."

          field :list_enabled_features_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnabledFeaturesCourse,
            description: "List enabled features. A paginated list of all features that are enabled on a given Account, Course, or User.   Only the feature names are returned."

          field :list_enabled_features_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnabledFeaturesAccount,
            description: "List enabled features. A paginated list of all features that are enabled on a given Account, Course, or User.   Only the feature names are returned."

          field :list_enabled_features_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListEnabledFeaturesUser,
            description: "List enabled features. A paginated list of all features that are enabled on a given Account, Course, or User.   Only the feature names are returned."

          field :get_feature_flag_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFeatureFlagCourse,
            description: "Get feature flag. Get the feature flag that applies to a given Account, Course, or User.   The flag may be defined on the object, or it may be inherited from a parent   account. You can look at the context_id and context_type of the returned object   to determine which is the case. If these fields are missing, then the object   is the global Canvas default."

          field :get_feature_flag_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFeatureFlagAccount,
            description: "Get feature flag. Get the feature flag that applies to a given Account, Course, or User.   The flag may be defined on the object, or it may be inherited from a parent   account. You can look at the context_id and context_type of the returned object   to determine which is the case. If these fields are missing, then the object   is the global Canvas default."

          field :get_feature_flag_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFeatureFlagUser,
            description: "Get feature flag. Get the feature flag that applies to a given Account, Course, or User.   The flag may be defined on the object, or it may be inherited from a parent   account. You can look at the context_id and context_type of the returned object   to determine which is the case. If these fields are missing, then the object   is the global Canvas default."

          field :get_quota_information_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetQuotaInformationCourse,
            description: "Get quota information. Returns the total and used storage quota for the course, group, or user."

          field :get_quota_information_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetQuotaInformationGroup,
            description: "Get quota information. Returns the total and used storage quota for the course, group, or user."

          field :get_quota_information_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetQuotaInformationUser,
            description: "Get quota information. Returns the total and used storage quota for the course, group, or user."

          field :list_files_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFilesCourse,
            description: "List files. Returns the paginated list of files for the folder or course."

          field :list_files_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFilesUser,
            description: "List files. Returns the paginated list of files for the folder or course."

          field :list_files_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFilesGroup,
            description: "List files. Returns the paginated list of files for the folder or course."

          field :list_files_folders,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFilesFolder,
            description: "List files. Returns the paginated list of files for the folder or course."

          field :get_public_inline_preview_url,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetPublicInlinePreviewUrl,
            description: "Get public inline preview url. Determine the URL that should be used for inline preview of the file."

          field :get_file_files,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFileFile,
            description: "Get file. Returns the standard attachment json object"

          field :get_file_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFileCourse,
            description: "Get file. Returns the standard attachment json object"

          field :get_file_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFileGroup,
            description: "Get file. Returns the standard attachment json object"

          field :get_file_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFileUser,
            description: "Get file. Returns the standard attachment json object"

          field :list_folders,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListFolder,
            description: "List folders. Returns the paginated list of folders in the folder."

          field :list_all_folders_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAllFoldersCourse,
            description: "List all folders. Returns the paginated list of all folders for the given context. This will   be returned as a flat list containing all subfolders as well."

          field :list_all_folders_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAllFoldersUser,
            description: "List all folders. Returns the paginated list of all folders for the given context. This will   be returned as a flat list containing all subfolders as well."

          field :list_all_folders_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAllFoldersGroup,
            description: "List all folders. Returns the paginated list of all folders for the given context. This will   be returned as a flat list containing all subfolders as well."

          field :resolve_path_courses_full_path,
            resolver: LMS::GraphQL::Resolvers::Canvas::ResolvePathCoursesFullPath,
            description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

          field :resolve_path_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ResolvePathCourse,
            description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

          field :resolve_path_users_full_path,
            resolver: LMS::GraphQL::Resolvers::Canvas::ResolvePathUsersFullPath,
            description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

          field :resolve_path_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ResolvePathUser,
            description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

          field :resolve_path_groups_full_path,
            resolver: LMS::GraphQL::Resolvers::Canvas::ResolvePathGroupsFullPath,
            description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

          field :resolve_path_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ResolvePathGroup,
            description: "Resolve path. Given the full path to a folder, returns a list of all Folders in the path hierarchy,   starting at the root folder, and ending at the requested folder. The given path is   relative to the context's root folder and does not include the root folder's name   (e.g., 'course files'). If an empty path is given, the context's root folder alone   is returned. Otherwise, if no folder exists with the given full path, a Not Found   error is returned."

          field :get_folder_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFolderCourse,
            description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

          field :get_folder_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFolderUser,
            description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

          field :get_folder_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFolderGroup,
            description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

          field :get_folder_folders,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetFolderFolder,
            description: "Get folder. Returns the details for a folder      You can get the root folder from a context by using 'root' as the :id.   For example, you could get the root folder for a course like:"

          field :list_licenses_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLicensesCourse,
            description: "List licenses. A paginated list of licenses that can be applied"

          field :list_licenses_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLicensesGroup,
            description: "List licenses. A paginated list of licenses that can be applied"

          field :list_licenses_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLicensesUser,
            description: "List licenses. A paginated list of licenses that can be applied"

          field :query_by_assignment,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryByAssignment,
            description: "Query by assignment.. List grade change events for a given assignment."

          field :grade_change_log_query_by_course,
            resolver: LMS::GraphQL::Resolvers::Canvas::GradeChangeLogQueryByCourse,
            description: "Query by course.. List grade change events for a given course."

          field :query_by_student,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryByStudent,
            description: "Query by student.. List grade change events for a given student."

          field :query_by_grader,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryByGrader,
            description: "Query by grader.. List grade change events for a given grader."

          field :days_in_gradebook_history_for_this_course,
            resolver: LMS::GraphQL::Resolvers::Canvas::DaysInGradebookHistoryForThisCourse,
            description: "Days in gradebook history for this course. Returns a map of dates to grader/assignment groups"

          field :details_for_given_date_in_gradebook_history_for_this_course,
            resolver: LMS::GraphQL::Resolvers::Canvas::DetailsForGivenDateInGradebookHistoryForThisCourse,
            description: "Details for a given date in gradebook history for this course. Returns the graders who worked on this day, along with the assignments they worked on.   More details can be obtained by selecting a grader and assignment and calling the   'submissions' api endpoint for a given date."

          field :lists_submissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListsSubmission,
            description: "Lists submissions. Gives a nested list of submission versions"

          field :list_uncollated_submission_versions,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUncollatedSubmissionVersion,
            description: "List uncollated submission versions. Gives a paginated, uncollated list of submission versions for all matching   submissions in the context. This SubmissionVersion objects will not include   the +new_grade+ or +previous_grade+ keys, only the +grade+; same for   +graded_at+ and +grader+."

          field :list_grading_periods_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGradingPeriodsAccount,
            description: "List grading periods. Returns the paginated list of grading periods for the current course."

          field :list_grading_periods_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGradingPeriodsCourse,
            description: "List grading periods. Returns the paginated list of grading periods for the current course."

          field :get_single_grading_period,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGradingPeriod,
            description: "Get a single grading period. Returns the grading period with the given id"

          field :list_grading_standards_available_in_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGradingStandardsAvailableInContextCourse,
            description: "List the grading standards available in a context.. Returns the paginated list of grading standards for the given context that are visible to the user."

          field :list_grading_standards_available_in_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGradingStandardsAvailableInContextAccount,
            description: "List the grading standards available in a context.. Returns the paginated list of grading standards for the given context that are visible to the user."

          field :get_single_grading_standard_in_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGradingStandardInContextCourse,
            description: "Get a single grading standard in a context.. Returns a grading standard for the given context that is visible to the user."

          field :get_single_grading_standard_in_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGradingStandardInContextAccount,
            description: "Get a single grading standard in a context.. Returns a grading standard for the given context that is visible to the user."

          field :list_group_categories_for_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupCategoriesForContextAccount,
            description: "List group categories for a context. Returns a paginated list of group categories in a context"

          field :list_group_categories_for_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupCategoriesForContextCourse,
            description: "List group categories for a context. Returns a paginated list of group categories in a context"

          field :get_single_group_category,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGroupCategory,
            description: "Get a single group category. Returns the data for a single group category, or a 401 if the caller doesn't have   the rights to see it."

          field :list_groups_in_group_category,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupsInGroupCategory,
            description: "List groups in group category. Returns a paginated list of groups in a group category"

          field :list_users_in_group_category,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUsersInGroupCategory,
            description: "List users in group category. Returns a paginated list of users in the group category."

          field :list_your_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListYourGroup,
            description: "List your groups. Returns a paginated list of active groups for the current user."

          field :list_groups_available_in_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupsAvailableInContextAccount,
            description: "List the groups available in a context.. Returns the paginated list of active groups in the given context that are visible to user."

          field :list_groups_available_in_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupsAvailableInContextCourse,
            description: "List the groups available in a context.. Returns the paginated list of active groups in the given context that are visible to user."

          field :get_single_group,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGroup,
            description: "Get a single group. Returns the data for a single group, or a 401 if the caller doesn't have   the rights to see it."

          field :list_group_s_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupSUser,
            description: "List group's users. Returns a paginated list of users in the group."

          field :group_activity_stream,
            resolver: LMS::GraphQL::Resolvers::Canvas::GroupActivityStream,
            description: "Group activity stream. Returns the current user's group-specific activity stream, paginated.      For full documentation, see the API documentation for the user activity   stream, in the user api."

          field :group_activity_stream_summary,
            resolver: LMS::GraphQL::Resolvers::Canvas::GroupActivityStreamSummary,
            description: "Group activity stream summary. Returns a summary of the current user's group-specific activity stream.      For full documentation, see the API documentation for the user activity   stream summary, in the user api."

          field :list_group_memberships,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGroupMembership,
            description: "List group memberships. A paginated list of the members of a group."

          field :get_single_group_membership_memberships,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGroupMembershipMembership,
            description: "Get a single group membership. Returns the group membership with the given membership id or user id."

          field :get_single_group_membership_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleGroupMembershipUser,
            description: "Get a single group membership. Returns the group membership with the given membership id or user id."

          field :get_late_policy,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetLatePolicy,
            description: "Get a late policy. Returns the late policy for a course."

          field :list_live_assessment_results,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLiveAssessmentResult,
            description: "List live assessment results. Returns a paginated list of live assessment results"

          field :list_live_assessments,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLiveAssessment,
            description: "List live assessments. Returns a paginated list of live assessments."

          field :list_user_logins_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUserLoginsAccount,
            description: "List user logins. Given a user ID, return a paginated list of that user's logins for the given account."

          field :list_user_logins_users,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUserLoginsUser,
            description: "List user logins. Given a user ID, return a paginated list of that user's logins for the given account."

          field :list_students_selected_for_moderation,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListStudentsSelectedForModeration,
            description: "List students selected for moderation. Returns a paginated list of students selected for moderation"

          field :show_provisional_grade_status_for_student,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowProvisionalGradeStatusForStudent,
            description: "Show provisional grade status for a student. Tell whether the student's submission needs one or more provisional grades."

          field :list_modules,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListModule,
            description: "List modules. A paginated list of the modules in a course"

          field :show_module,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowModule,
            description: "Show module. Get information about a single module"

          field :list_module_items,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListModuleItem,
            description: "List module items. A paginated list of the items in a module"

          field :show_module_item,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowModuleItem,
            description: "Show module item. Get information about a single module item"

          field :get_module_item_sequence,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetModuleItemSequence,
            description: "Get module item sequence. Given an asset in a course, find the ModuleItem it belongs to, the previous and next Module Items   in the course sequence, and also any applicable mastery path rules"

          field :list_preferences_communication_channel_id,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPreferencesCommunicationChannelId,
            description: "List preferences. Fetch all preferences for the given communication channel"

          field :list_preferences_type,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPreferencesType,
            description: "List preferences. Fetch all preferences for the given communication channel"

          field :list_of_preference_categories,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListOfPreferenceCategory,
            description: "List of preference categories. Fetch all notification preference categories for the given communication channel"

          field :get_preference_communication_channel_id,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetPreferenceCommunicationChannelId,
            description: "Get a preference. Fetch the preference for the given notification for the given communicaiton channel"

          field :get_preference_type,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetPreferenceType,
            description: "Get a preference. Fetch the preference for the given notification for the given communicaiton channel"

          field :show_originality_report_submissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowOriginalityReportSubmission,
            description: "Show an Originality Report. Get a single originality report"

          field :show_originality_report_files,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowOriginalityReportFile,
            description: "Show an Originality Report. Get a single originality report"

          field :redirect_to_root_outcome_group_for_context_global,
            resolver: LMS::GraphQL::Resolvers::Canvas::RedirectToRootOutcomeGroupForContextGlobal,
            description: "Redirect to root outcome group for context. Convenience redirect to find the root outcome group for a particular   context. Will redirect to the appropriate outcome group's URL."

          field :redirect_to_root_outcome_group_for_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::RedirectToRootOutcomeGroupForContextAccount,
            description: "Redirect to root outcome group for context. Convenience redirect to find the root outcome group for a particular   context. Will redirect to the appropriate outcome group's URL."

          field :redirect_to_root_outcome_group_for_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::RedirectToRootOutcomeGroupForContextCourse,
            description: "Redirect to root outcome group for context. Convenience redirect to find the root outcome group for a particular   context. Will redirect to the appropriate outcome group's URL."

          field :get_all_outcome_groups_for_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllOutcomeGroupsForContextAccount,
            description: "Get all outcome groups for context. "

          field :get_all_outcome_groups_for_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllOutcomeGroupsForContextCourse,
            description: "Get all outcome groups for context. "

          field :get_all_outcome_links_for_context_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllOutcomeLinksForContextAccount,
            description: "Get all outcome links for context. "

          field :get_all_outcome_links_for_context_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllOutcomeLinksForContextCourse,
            description: "Get all outcome links for context. "

          field :show_outcome_group_global,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowOutcomeGroupGlobal,
            description: "Show an outcome group. "

          field :show_outcome_group_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowOutcomeGroupAccount,
            description: "Show an outcome group. "

          field :show_outcome_group_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowOutcomeGroupCourse,
            description: "Show an outcome group. "

          field :list_linked_outcomes_global,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLinkedOutcomesGlobal,
            description: "List linked outcomes. A paginated list of the immediate OutcomeLink children of the outcome group."

          field :list_linked_outcomes_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLinkedOutcomesAccount,
            description: "List linked outcomes. A paginated list of the immediate OutcomeLink children of the outcome group."

          field :list_linked_outcomes_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListLinkedOutcomesCourse,
            description: "List linked outcomes. A paginated list of the immediate OutcomeLink children of the outcome group."

          field :list_subgroups_global,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListSubgroupsGlobal,
            description: "List subgroups. A paginated list of the immediate OutcomeGroup children of the outcome group."

          field :list_subgroups_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListSubgroupsAccount,
            description: "List subgroups. A paginated list of the immediate OutcomeGroup children of the outcome group."

          field :list_subgroups_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListSubgroupsCourse,
            description: "List subgroups. A paginated list of the immediate OutcomeGroup children of the outcome group."

          field :get_outcome_import_status_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetOutcomeImportStatusAccount,
            description: "Get Outcome import status. Get the status of an already created Outcome import. Pass 'latest' for the outcome import id   for the latest import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'       curl 'https: <canvas>/api/v1/courses/<course_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'"

          field :get_outcome_import_status_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetOutcomeImportStatusCourse,
            description: "Get Outcome import status. Get the status of an already created Outcome import. Pass 'latest' for the outcome import id   for the latest import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'       curl 'https: <canvas>/api/v1/courses/<course_id>/outcome_imports/<outcome_import_id>' \           -H 'Authorization: Bearer <token>'"

          field :get_outcome_results,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetOutcomeResult,
            description: "Get outcome results. Gets the outcome results for users and outcomes in the specified context."

          field :get_outcome_result_rollups,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetOutcomeResultRollup,
            description: "Get outcome result rollups. Gets the outcome rollups for the users and outcomes in the specified   context."

          field :show_outcome,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowOutcome,
            description: "Show an outcome. Returns the details of the outcome with the given id."

          field :show_front_page_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowFrontPageCourse,
            description: "Show front page. Retrieve the content of the front page"

          field :show_front_page_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowFrontPageGroup,
            description: "Show front page. Retrieve the content of the front page"

          field :list_pages_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPagesCourse,
            description: "List pages. A paginated list of the wiki pages associated with a course or group"

          field :list_pages_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPagesGroup,
            description: "List pages. A paginated list of the wiki pages associated with a course or group"

          field :show_page_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowPageCourse,
            description: "Show page. Retrieve the content of a wiki page"

          field :show_page_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowPageGroup,
            description: "Show page. Retrieve the content of a wiki page"

          field :list_revisions_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListRevisionsCourse,
            description: "List revisions. A paginated list of the revisions of a page. Callers must have update rights on the page in order to see page history."

          field :list_revisions_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListRevisionsGroup,
            description: "List revisions. A paginated list of the revisions of a page. Callers must have update rights on the page in order to see page history."

          field :show_revision_courses_latest,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowRevisionCoursesLatest,
            description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

          field :show_revision_groups_latest,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowRevisionGroupsLatest,
            description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

          field :show_revision_courses_revision_id,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowRevisionCoursesRevisionId,
            description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

          field :show_revision_groups_revision_id,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowRevisionGroupsRevisionId,
            description: "Show revision. Retrieve the metadata and optionally content of a revision of the page.   Note that retrieving historic versions of pages requires edit rights."

          field :get_all_peer_reviews_courses_peer_reviews,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllPeerReviewsCoursesPeerReview,
            description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

          field :get_all_peer_reviews_sections_peer_reviews,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllPeerReviewsSectionsPeerReview,
            description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

          field :get_all_peer_reviews_courses_submissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllPeerReviewsCoursesSubmission,
            description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

          field :get_all_peer_reviews_sections_submissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllPeerReviewsSectionsSubmission,
            description: "Get all Peer Reviews. Get a list of all Peer Reviews for this assignment"

          field :get_single_assignment_lti,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleAssignmentLti,
            description: "Get a single assignment (lti). Get a single Canvas assignment by Canvas id or LTI id. Tool providers may only access   assignments that are associated with their tool."

          field :get_single_user_lti,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleUserLti,
            description: "Get a single user (lti). Get a single Canvas user by Canvas id or LTI id. Tool providers may only access   users that have been assigned an assignment associated with their tool."

          field :get_all_users_in_group_lti,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllUsersInGroupLti,
            description: "Get all users in a group (lti). Get all Canvas users in a group. Tool providers may only access   groups that belong to the context the tool is installed in."

          field :get_single_submission,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleSubmission,
            description: "Get a single submission. Get a single submission, based on submission id."

          field :get_history_of_single_submission,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetHistoryOfSingleSubmission,
            description: "Get the history of a single submission. Get a list of all attempts made for a submission, based on submission id."

          field :list_planner_items,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPlannerItem,
            description: "List planner items. Retrieve the paginated list of objects to be shown on the planner for the   current user with the associated planner override to override an item's   visibility if set.      [     {       'context_type': 'Course',       'course_id': 1,       'visible_in_planner': true,   Whether or not it is displayed on the student planner       'planner_override': { ... planner override object ... },   Associated PlannerOverride object if user has toggled visibility for the object on the planner       'submissions': false,   The statuses of the user's submissions for this object       'plannable_id': '123',       'plannable_type': 'discussion_topic',       'plannable': { ... discussion topic object },       'html_url': '/courses/1/discussion_topics/8'     },     {       'context_type': 'Course',       'course_id': 1,       'visible_in_planner': true,       'planner_override': {           'id': 3,           'plannable_type': 'Assignment',           'plannable_id': 1,           'user_id': 2,           'workflow_state': 'active',           'marked_complete': true,   A user-defined setting for marking items complete in the planner           'dismissed': false,   A user-defined setting for hiding items from the opportunities list           'deleted_at': null,           'created_at': '2017-05-18T18:35:55Z',           'updated_at': '2017-05-18T18:35:55Z'       },       'submissions': {   The status as it pertains to the current user         'excused': false,         'graded': false,         'late': false,         'missing': true,         'needs_grading': false,         'with_feedback': false       },       'plannable_id': '456',       'plannable_type': 'assignment',       'plannable': { ... assignment object ...  },       'html_url': 'http: canvas.instructure.com/courses/1/assignments/1#submit'     },     {       'visible_in_planner': true,       'planner_override': null,       'submissions': false,   false if no associated assignment exists for the plannable item       'plannable_id': '789',       'plannable_type': 'planner_note',       'plannable': {         'id': 1,         'todo_date': '2017-05-30T06:00:00Z',         'title': 'hello',         'details': 'world',         'user_id': 2,         'course_id': null,         'workflow_state': 'active',         'created_at': '2017-05-30T16:29:04Z',         'updated_at': '2017-05-30T16:29:15Z'       },       'html_url': 'http: canvas.instructure.com/api/v1/planner_notes.1'     }   ]"

          field :list_planner_notes,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPlannerNote,
            description: "List planner notes. Retrieve the paginated list of planner notes      Retrieve planner note for a user"

          field :show_plannernote,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowPlannernote,
            description: "Show a PlannerNote. Retrieve a planner note for the current user"

          field :list_planner_overrides,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPlannerOverride,
            description: "List planner overrides. Retrieve a planner override for the current user"

          field :show_planner_override,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowPlannerOverride,
            description: "Show a planner override. Retrieve a planner override for the current user"

          field :list_poll_sessions_for_poll,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPollSessionsForPoll,
            description: "List poll sessions for a poll. Returns the paginated list of PollSessions in this poll."

          field :get_results_for_single_poll_session,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetResultsForSinglePollSession,
            description: "Get the results for a single poll session. Returns the poll session with the given id"

          field :open_poll_session,
            resolver: LMS::GraphQL::Resolvers::Canvas::OpenPollSession,
            description: "Open a poll session. "

          field :close_opened_poll_session,
            resolver: LMS::GraphQL::Resolvers::Canvas::CloseOpenedPollSession,
            description: "Close an opened poll session. "

          field :list_opened_poll_sessions,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListOpenedPollSession,
            description: "List opened poll sessions. A paginated list of all opened poll sessions available to the current user."

          field :list_closed_poll_sessions,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListClosedPollSession,
            description: "List closed poll sessions. A paginated list of all closed poll sessions available to the current user."

          field :list_poll_choices_in_poll,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPollChoicesInPoll,
            description: "List poll choices in a poll. Returns the paginated list of PollChoices in this poll."

          field :get_single_poll_choice,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSinglePollChoice,
            description: "Get a single poll choice. Returns the poll choice with the given id"

          field :get_single_poll_submission,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSinglePollSubmission,
            description: "Get a single poll submission. Returns the poll submission with the given id"

          field :list_polls,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListPoll,
            description: "List polls. Returns the paginated list of polls for the current user."

          field :get_single_poll,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSinglePoll,
            description: "Get a single poll. Returns the poll with the given id"

          field :query_progress,
            resolver: LMS::GraphQL::Resolvers::Canvas::QueryProgress,
            description: "Query progress. Return completion and status information about an asynchronous job"

          field :retrieve_assignment_overridden_dates_for_quizzes,
            resolver: LMS::GraphQL::Resolvers::Canvas::RetrieveAssignmentOverriddenDatesForQuiz,
            description: "Retrieve assignment-overridden dates for quizzes. Retrieve the actual due-at, unlock-at, and available-at dates for quizzes   based on the assignment overrides active for the current API user."

          field :get_available_quiz_ip_filters,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAvailableQuizIpFilter,
            description: "Get available quiz IP filters.. Get a list of available IP filters for this Quiz.      <b>200 OK</b> response code is returned if the request was successful."

          field :get_single_quiz_group,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleQuizGroup,
            description: "Get a single quiz group. Returns details of the quiz group with the given id."

          field :list_questions_in_quiz_or_submission,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListQuestionsInQuizOrSubmission,
            description: "List questions in a quiz or a submission. Returns the paginated list of QuizQuestions in this quiz."

          field :get_single_quiz_question,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleQuizQuestion,
            description: "Get a single quiz question. Returns the quiz question with the given id"

          field :retrieve_all_quiz_reports,
            resolver: LMS::GraphQL::Resolvers::Canvas::RetrieveAllQuizReport,
            description: "Retrieve all quiz reports. Returns a list of all available reports."

          field :get_quiz_report,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetQuizReport,
            description: "Get a quiz report. Returns the data for a single quiz report."

          field :fetching_latest_quiz_statistics,
            resolver: LMS::GraphQL::Resolvers::Canvas::FetchingLatestQuizStatistic,
            description: "Fetching the latest quiz statistics. This endpoint provides statistics for all quiz versions, or for a specific   quiz version, in which case the output is guaranteed to represent the   _latest_ and most current version of the quiz.      <b>200 OK</b> response code is returned if the request was successful."

          field :retrieve_captured_events,
            resolver: LMS::GraphQL::Resolvers::Canvas::RetrieveCapturedEvent,
            description: "Retrieve captured events. Retrieve the set of events captured during a specific submission attempt."

          field :get_all_quiz_submission_questions,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllQuizSubmissionQuestion,
            description: "Get all quiz submission questions.. Get a list of all the question records for this quiz submission.      <b>200 OK</b> response code is returned if the request was successful."

          field :get_all_quiz_submissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetAllQuizSubmission,
            description: "Get all quiz submissions.. Get a list of all submissions for this quiz. Users who can view or manage   grades for a course will have submissions from multiple users returned. A   user who can only submit will have only their own submissions returned. When   a user has an in-progress submission, only that submission is returned. When   there isn't an in-progress quiz_submission, all completed submissions,   including previous attempts, are returned.      <b>200 OK</b> response code is returned if the request was successful."

          field :get_quiz_submission,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetQuizSubmission,
            description: "Get the quiz submission.. Get the submission for this quiz for the current user.      <b>200 OK</b> response code is returned if the request was successful."

          field :get_single_quiz_submission,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleQuizSubmission,
            description: "Get a single quiz submission.. Get a single quiz submission.      <b>200 OK</b> response code is returned if the request was successful."

          field :get_current_quiz_submission_times,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCurrentQuizSubmissionTime,
            description: "Get current quiz submission times.. Get the current timing data for the quiz attempt, both the end_at timestamp   and the time_left parameter.      <b>Responses</b>      * <b>200 OK</b> if the request was successful"

          field :list_quizzes_in_course,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListQuizzesInCourse,
            description: "List quizzes in a course. Returns the paginated list of Quizzes in this course."

          field :get_single_quiz,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleQuiz,
            description: "Get a single quiz. Returns the quiz with the given id."

          field :list_roles,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListRole,
            description: "List roles. A paginated list of the roles available to an account."

          field :get_single_role,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleRole,
            description: "Get a single role. Retrieve information about a single role"

          field :list_rubrics_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListRubricsAccount,
            description: "List rubrics. Returns the paginated list of active rubrics for the current context."

          field :list_rubrics_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListRubricsCourse,
            description: "List rubrics. Returns the paginated list of active rubrics for the current context."

          field :get_single_rubric_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleRubricAccount,
            description: "Get a single rubric. Returns the rubric with the given id."

          field :get_single_rubric_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleRubricCourse,
            description: "Get a single rubric. Returns the rubric with the given id."

          field :get_sis_import_error_list_sis_imports,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSisImportErrorListSisImport,
            description: "Get SIS import error list. Returns the list of SIS import errors for an account or a SIS import. Import   errors are only stored for 30 days.      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_imports/<id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'"

          field :get_sis_import_error_list_sis_import_errors,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSisImportErrorListSisImportError,
            description: "Get SIS import error list. Returns the list of SIS import errors for an account or a SIS import. Import   errors are only stored for 30 days.      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_imports/<id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_import_errors' \       -H 'Authorization: Bearer <token>'"

          field :get_sis_import_list,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSisImportList,
            description: "Get SIS import list. Returns the list of SIS imports for an account      Example:     curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_imports' \       -H 'Authorization: Bearer <token>'"

          field :get_sis_import_status,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSisImportStatus,
            description: "Get SIS import status. Get the status of an already created SIS import.        Examples:       curl 'https: <canvas>/api/v1/accounts/<account_id>/sis_imports/<sis_import_id>' \           -H 'Authorization: Bearer <token>'"

          field :retrieve_assignments_enabled_for_grade_export_to_sis_accounts,
            resolver: LMS::GraphQL::Resolvers::Canvas::RetrieveAssignmentsEnabledForGradeExportToSisAccount,
            description: "Retrieve assignments enabled for grade export to SIS. Retrieve a list of published assignments flagged as 'post_to_sis'.   See the Assignments API for more details on assignments.   Assignment group and section information are included for convenience.      Each section includes course information for the origin course and the   cross-listed course, if applicable. The `origin_course` is the course to   which the section belongs or the course from which the section was   cross-listed. Generally, the `origin_course` should be preferred when   performing integration work. The `xlist_course` is provided for consistency   and is only present when the section has been cross-listed.   See Sections API and Courses Api for me details.      The `override` is only provided if the Differentiated Assignments course   feature is turned on and the assignment has an override for that section.   When there is an override for the assignment the override object's   keys/values can be merged with the top level assignment object to create a   view of the assignment object specific to that section.   See Assignments api for more information on assignment overrides.      restricts to courses that start before this date (if they have a start date)   restricts to courses that end after this date (if they have an end date)   information to include.        'student_overrides':: returns individual student override information"

          field :retrieve_assignments_enabled_for_grade_export_to_sis_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::RetrieveAssignmentsEnabledForGradeExportToSisCourse,
            description: "Retrieve assignments enabled for grade export to SIS. Retrieve a list of published assignments flagged as 'post_to_sis'.   See the Assignments API for more details on assignments.   Assignment group and section information are included for convenience.      Each section includes course information for the origin course and the   cross-listed course, if applicable. The `origin_course` is the course to   which the section belongs or the course from which the section was   cross-listed. Generally, the `origin_course` should be preferred when   performing integration work. The `xlist_course` is provided for consistency   and is only present when the section has been cross-listed.   See Sections API and Courses Api for me details.      The `override` is only provided if the Differentiated Assignments course   feature is turned on and the assignment has an override for that section.   When there is an override for the assignment the override object's   keys/values can be merged with the top level assignment object to create a   view of the assignment object specific to that section.   See Assignments api for more information on assignment overrides.      restricts to courses that start before this date (if they have a start date)   restricts to courses that end after this date (if they have an end date)   information to include.        'student_overrides':: returns individual student override information"

          field :list_scopes,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListScope,
            description: "List scopes. A list of scopes that can be applied to developer keys and access tokens."

          field :find_recipients_conversations,
            resolver: LMS::GraphQL::Resolvers::Canvas::FindRecipientsConversation,
            description: "Find recipients. Find valid recipients (users, courses and groups) that the current user   can send messages to. The /api/v1/search/recipients path is the preferred   endpoint, /api/v1/conversations/find_recipients is deprecated.      Pagination is supported."

          field :find_recipients_search,
            resolver: LMS::GraphQL::Resolvers::Canvas::FindRecipientsSearch,
            description: "Find recipients. Find valid recipients (users, courses and groups) that the current user   can send messages to. The /api/v1/search/recipients path is the preferred   endpoint, /api/v1/conversations/find_recipients is deprecated.      Pagination is supported."

          field :list_all_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAllCourse,
            description: "List all courses. A paginated list of all courses visible in the public index"

          field :list_course_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCourseSection,
            description: "List course sections. A paginated list of the list of sections for this course."

          field :get_section_information_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSectionInformationCourse,
            description: "Get section information. Gets details about a specific section"

          field :get_section_information_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSectionInformationSection,
            description: "Get section information. Gets details about a specific section"

          field :get_kaltura_config,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetKalturaConfig,
            description: "Get Kaltura config. Return the config information for the Kaltura plugin in json format."

          field :list_assignment_submissions_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAssignmentSubmissionsCourse,
            description: "List assignment submissions. A paginated list of all existing submissions for an assignment."

          field :list_assignment_submissions_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAssignmentSubmissionsSection,
            description: "List assignment submissions. A paginated list of all existing submissions for an assignment."

          field :list_submissions_for_multiple_assignments_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListSubmissionsForMultipleAssignmentsCourse,
            description: "List submissions for multiple assignments. A paginated list of all existing submissions for a given set of students and assignments."

          field :list_submissions_for_multiple_assignments_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListSubmissionsForMultipleAssignmentsSection,
            description: "List submissions for multiple assignments. A paginated list of all existing submissions for a given set of students and assignments."

          field :get_single_submission_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleSubmissionCourse,
            description: "Get a single submission. Get a single submission, based on user id."

          field :get_single_submission_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetSingleSubmissionSection,
            description: "Get a single submission. Get a single submission, based on user id."

          field :list_gradeable_students,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListGradeableStudent,
            description: "List gradeable students. A paginated list of students eligible to submit the assignment. The caller must have permission to view grades.      Section-limited instructors will only see students in their own sections.      returns [UserDisplay]"

          field :list_multiple_assignments_gradeable_students,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMultipleAssignmentsGradeableStudent,
            description: "List multiple assignments gradeable students. A paginated list of students eligible to submit a list of assignments. The caller must have   permission to view grades for the requested course.      Section-limited instructors will only see students in their own sections."

          field :submission_summary_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::SubmissionSummaryCourse,
            description: "Submission Summary. Returns the number of submissions for the given assignment based on gradeable students   that fall into three categories: graded, ungraded, not submitted."

          field :submission_summary_sections,
            resolver: LMS::GraphQL::Resolvers::Canvas::SubmissionSummarySection,
            description: "Submission Summary. Returns the number of submissions for the given assignment based on gradeable students   that fall into three categories: graded, ungraded, not submitted."

          field :list_available_tabs_for_course_or_group_courses,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAvailableTabsForCourseOrGroupCourse,
            description: "List available tabs for a course or group. Returns a paginated list of navigation tabs available in the current context."

          field :list_available_tabs_for_course_or_group_groups,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAvailableTabsForCourseOrGroupGroup,
            description: "List available tabs for a course or group. Returns a paginated list of navigation tabs available in the current context."

          field :list_observees,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListObservee,
            description: "List observees. A paginated list of the users that the given user is observing.      *Note:* all users are allowed to list their own observees. Administrators can list   other users' observees.      The returned observees will include an attribute 'observation_link_root_account_ids', a list   of ids for the root accounts the observer and observee are linked on. The observer will only be able to   observe in courses associated with these root accounts."

          field :show_observee,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowObservee,
            description: "Show an observee. Gets information about an observed user.      *Note:* all users are allowed to view their own observees."

          field :list_users_in_account,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUsersInAccount,
            description: "List users in account. A paginated list of of users associated with this account.       @example_request      curl https: <canvas>/api/v1/accounts/self/users?search_term=<search value> \         -X GET \         -H 'Authorization: Bearer <token>'"

          field :list_activity_stream_self,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListActivityStreamSelf,
            description: "List the activity stream. Returns the current user's global activity stream, paginated.      There are many types of objects that can be returned in the activity   stream. All object types have the same basic set of shared attributes:     !!!javascript     {       'created_at': '2011-07-13T09:12:00Z',       'updated_at': '2011-07-25T08:52:41Z',       'id': 1234,       'title': 'Stream Item Subject',       'message': 'This is the body text of the activity stream item. It is plain-text, and can be multiple paragraphs.',       'type': 'DiscussionTopic|Conversation|Message|Submission|Conference|Collaboration|AssessmentRequest...',       'read_state': false,       'context_type': 'course',   course|group       'course_id': 1,       'group_id': null,       'html_url': 'http: ...'   URL to the Canvas web UI for this stream item     }      In addition, each item type has its own set of attributes available.      DiscussionTopic:        !!!javascript     {       'type': 'DiscussionTopic',       'discussion_topic_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': true,       'root_discussion_entries': {         ...       }     }      For DiscussionTopic, the message is truncated at 4kb.      Announcement:        !!!javascript     {       'type': 'Announcement',       'announcement_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': null,       'root_discussion_entries': {         ...       }     }      For Announcement, the message is truncated at 4kb.      Conversation:        !!!javascript     {       'type': 'Conversation',       'conversation_id': 1234,       'private': false,       'participant_count': 3,     }      Message:        !!!javascript     {       'type': 'Message',       'message_id': 1234,       'notification_category': 'Assignment Graded'     }      Submission:      Returns an {api:Submissions:Submission Submission} with its Course and Assignment data.      Conference:        !!!javascript     {       'type': 'Conference',       'web_conference_id': 1234     }      Collaboration:        !!!javascript     {       'type': 'Collaboration',       'collaboration_id': 1234     }      AssessmentRequest:        !!!javascript     {       'type': 'AssessmentRequest',       'assessment_request_id': 1234     }"

          field :list_activity_stream_activity_stream,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListActivityStreamActivityStream,
            description: "List the activity stream. Returns the current user's global activity stream, paginated.      There are many types of objects that can be returned in the activity   stream. All object types have the same basic set of shared attributes:     !!!javascript     {       'created_at': '2011-07-13T09:12:00Z',       'updated_at': '2011-07-25T08:52:41Z',       'id': 1234,       'title': 'Stream Item Subject',       'message': 'This is the body text of the activity stream item. It is plain-text, and can be multiple paragraphs.',       'type': 'DiscussionTopic|Conversation|Message|Submission|Conference|Collaboration|AssessmentRequest...',       'read_state': false,       'context_type': 'course',   course|group       'course_id': 1,       'group_id': null,       'html_url': 'http: ...'   URL to the Canvas web UI for this stream item     }      In addition, each item type has its own set of attributes available.      DiscussionTopic:        !!!javascript     {       'type': 'DiscussionTopic',       'discussion_topic_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': true,       'root_discussion_entries': {         ...       }     }      For DiscussionTopic, the message is truncated at 4kb.      Announcement:        !!!javascript     {       'type': 'Announcement',       'announcement_id': 1234,       'total_root_discussion_entries': 5,       'require_initial_post': true,       'user_has_posted': null,       'root_discussion_entries': {         ...       }     }      For Announcement, the message is truncated at 4kb.      Conversation:        !!!javascript     {       'type': 'Conversation',       'conversation_id': 1234,       'private': false,       'participant_count': 3,     }      Message:        !!!javascript     {       'type': 'Message',       'message_id': 1234,       'notification_category': 'Assignment Graded'     }      Submission:      Returns an {api:Submissions:Submission Submission} with its Course and Assignment data.      Conference:        !!!javascript     {       'type': 'Conference',       'web_conference_id': 1234     }      Collaboration:        !!!javascript     {       'type': 'Collaboration',       'collaboration_id': 1234     }      AssessmentRequest:        !!!javascript     {       'type': 'AssessmentRequest',       'assessment_request_id': 1234     }"

          field :activity_stream_summary,
            resolver: LMS::GraphQL::Resolvers::Canvas::ActivityStreamSummary,
            description: "Activity stream summary. Returns a summary of the current user's global activity stream."

          field :list_todo_items,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListTodoItem,
            description: "List the TODO items. A paginated list of the current user's list of todo items, as seen on the user dashboard.      There is a limit to the number of items returned.      The `ignore` and `ignore_permanently` URLs can be used to update the user's   preferences on what items will be displayed.   Performing a DELETE request against the `ignore` URL will hide that item   from future todo item requests, until the item changes.   Performing a DELETE request against the `ignore_permanently` URL will hide   that item forever."

          field :list_counts_for_todo_items,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCountsForTodoItem,
            description: "List counts for todo items. Counts of different todo items such as the number of assignments needing grading as well as the number of assignments needing submitting.      There is a limit to the number of todo items this endpoint will count.   It will only look at the first 100 todo items for the user. If the user has more than 100 todo items this count may not be reliable.   The largest reliable number for both counts is 100."

          field :list_upcoming_assignments_calendar_events,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUpcomingAssignmentsCalendarEvent,
            description: "List upcoming assignments, calendar events. A paginated list of the current user's upcoming events, i.e. the same things shown   in the dashboard 'Coming Up' sidebar."

          field :list_missing_submissions,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListMissingSubmission,
            description: "List Missing Submissions. A paginated list of past-due assignments for which the student does not have a submission.   The user sending the request must either be an admin or a parent observer using the parent app"

          field :show_user_details,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowUserDetail,
            description: "Show user details. Shows details for user.      Also includes an attribute 'permissions', a non-comprehensive list of permissions for the user.   Example:     !!!javascript     'permissions': {      'can_update_name': true,   Whether the user can update their name.      'can_update_avatar': false   Whether the user can update their avatar.     }"

          field :update_user_settings,
            resolver: LMS::GraphQL::Resolvers::Canvas::UpdateUserSetting,
            description: "Update user settings.. Update an existing user's settings."

          field :get_custom_colors,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCustomColor,
            description: "Get custom colors. Returns all custom colors that have been saved for a user."

          field :get_custom_color,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCustomColor,
            description: "Get custom color. Returns the custom colors that have been saved for a user for a given context.      The asset_string parameter should be in the format 'context_id', for example   'course_42'."

          field :get_dashboard_positions,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetDashboardPosition,
            description: "Get dashboard positions. Returns all dashboard positions that have been saved for a user."

          field :get_user_profile,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetUserProfile,
            description: "Get user profile. Returns user profile data, including user id, name, and profile pic.      When requesting the profile for the user accessing the API, the user's   calendar feed URL and LTI user id will be returned as well."

          field :list_avatar_options,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAvatarOption,
            description: "List avatar options. A paginated list of the possible user avatar options that can be set with the user update endpoint. The response will be an array of avatar records. If the 'type' field is 'attachment', the record will include all the normal attachment json fields; otherwise it will include only the 'url' and 'display_name' fields. Additionally, all records will include a 'type' field and a 'token' field. The following explains each field in more detail   type:: ['gravatar'|'attachment'|'no_pic'] The type of avatar record, for categorization purposes.   url:: The url of the avatar   token:: A unique representation of the avatar record which can be used to set the avatar with the user update endpoint. Note: this is an internal representation and is subject to change without notice. It should be consumed with this api endpoint and used in the user update endpoint, and should not be constructed by the client.   display_name:: A textual description of the avatar record   id:: ['attachment' type only] the internal id of the attachment   content-type:: ['attachment' type only] the content-type of the attachment   filename:: ['attachment' type only] the filename of the attachment   size:: ['attachment' type only] the size of the attachment"

          field :list_user_page_views,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListUserPageView,
            description: "List user page views. Return a paginated list of the user's page view history in json format,   similar to the available CSV download. Page views are returned in   descending order, newest to oldest."

          field :load_custom_data,
            resolver: LMS::GraphQL::Resolvers::Canvas::LoadCustomDatum,
            description: "Load custom data. Load custom user data.      Arbitrary JSON data can be stored for a User.  This API call   retrieves that data for a (optional) given scope.   See {api:UsersController#set_custom_data Store Custom Data} for details and   examples.      On success, this endpoint returns an object containing the data that was requested.      Responds with status code 400 if the namespace parameter, +ns+, is missing or invalid,   or if the specified scope does not contain any data."

          field :list_course_nicknames,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCourseNickname,
            description: "List course nicknames. Returns all course nicknames you have set."

          field :get_course_nickname,
            resolver: LMS::GraphQL::Resolvers::Canvas::GetCourseNickname,
            description: "Get course nickname. Returns the nickname for a specific course."

          field :show_single_webhook_subscription,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowSingleWebhookSubscription,
            description: "Show a single Webhook Subscription. "

          field :list_all_webhook_subscription_for_tool_proxy,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListAllWebhookSubscriptionForToolProxy,
            description: "List all Webhook Subscription for a tool proxy. This endpoint returns a paginated list with a default limit of 100 items per result set.   You can retrieve the next result set by setting a 'StartKey' header in your next request   with the value of the 'EndKey' header in the response.      Example use of a 'StartKey' header object:     { 'Id':'71d6dfba-0547-477d-b41d-db8cb528c6d1','DeveloperKey':'10000000000001' }"

          field :list_courses_with_their_latest_epub_export,
            resolver: LMS::GraphQL::Resolvers::Canvas::ListCoursesWithTheirLatestEpubExport,
            description: "List courses with their latest ePub export. A paginated list of all courses a user is actively participating in, and   the latest ePub export associated with the user & course."

          field :show_epub_export,
            resolver: LMS::GraphQL::Resolvers::Canvas::ShowEpubExport,
            description: "Show ePub export. Get information about a single ePub export."
        end
      end
    end
  end
end