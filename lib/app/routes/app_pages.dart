import 'package:get/get.dart';

import '../modules/Mentee/PostQuestions/bindings/post_questions_binding.dart';
import '../modules/Mentee/PostQuestions/views/post_questions_view.dart';
import '../modules/Mentee/QuestionAndAnswerForum/bindings/question_and_answer_forum_binding.dart';
import '../modules/Mentee/QuestionAndAnswerForum/views/question_and_answer_forum_view.dart';
import '../modules/Mentee/appGuide/bindings/app_guide_binding.dart';
import '../modules/Mentee/appGuide/views/app_guide_view.dart';
import '../modules/Mentee/availbility/bindings/availbility_binding.dart';
import '../modules/Mentee/availbility/views/availbility_view.dart';
import '../modules/Mentee/careerGoals/bindings/career_goals_binding.dart';
import '../modules/Mentee/careerGoals/views/career_goals_view.dart';
import '../modules/Mentee/changePassword/bindings/change_password_binding.dart';
import '../modules/Mentee/changePassword/views/change_password_view.dart';
import '../modules/Mentee/chats/bindings/chats_binding.dart';
import '../modules/Mentee/chats/views/chats_view.dart';
import '../modules/Mentee/congratulations/bindings/congratulations_binding.dart';
import '../modules/Mentee/congratulations/views/congratulations_view.dart';
import '../modules/Mentee/education/bindings/education_binding.dart';
import '../modules/Mentee/education/views/education_view.dart';
import '../modules/Mentee/findMentors/bindings/find_mentors_binding.dart';
import '../modules/Mentee/findMentors/views/find_mentors_view.dart';
import '../modules/Mentee/getStarted/bindings/get_started_binding.dart';
import '../modules/Mentee/getStarted/views/get_started_view.dart';
import '../modules/Mentee/home/bindings/home_binding.dart';
import '../modules/Mentee/home/views/home_view.dart';
import '../modules/Mentee/inmeetingScreen/bindings/inmeeting_screen_binding.dart';
import '../modules/Mentee/inmeetingScreen/views/inmeeting_screen_view.dart';
import '../modules/Mentee/jobDetails/bindings/job_details_binding.dart';
import '../modules/Mentee/jobDetails/views/job_details_view.dart';
import '../modules/Mentee/meetings/bindings/meetings_binding.dart';
import '../modules/Mentee/meetings/views/meetings_view.dart';
import '../modules/Mentee/messages/bindings/messages_binding.dart';
import '../modules/Mentee/messages/views/messages_view.dart';
import '../modules/Mentee/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/Mentee/onBoarding/views/on_boarding_view.dart';
import '../modules/Mentee/postedJobs/bindings/posted_jobs_binding.dart';
import '../modules/Mentee/postedJobs/views/posted_jobs_view.dart';
import '../modules/Mentee/preferredMentor/bindings/preferred_mentor_binding.dart';
import '../modules/Mentee/preferredMentor/views/preferred_mentor_view.dart';
import '../modules/Mentee/privacyPolicy/bindings/privacy_policy_binding.dart';
import '../modules/Mentee/privacyPolicy/views/privacy_policy_view.dart';
import '../modules/Mentee/profile/bindings/profile_binding.dart';
import '../modules/Mentee/profile/views/profile_view.dart';
import '../modules/Mentee/scheduleSession/bindings/schedule_session_binding.dart';
import '../modules/Mentee/scheduleSession/views/schedule_session_view.dart';
import '../modules/Mentee/skills/bindings/skills_binding.dart';
import '../modules/Mentee/skills/views/skills_view.dart';
import '../modules/Mentee/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/Mentee/splashscreen/views/splashscreen_view.dart';
import '../modules/Mentor/MentorAvailability/bindings/mentor_availability_binding.dart';
import '../modules/Mentor/MentorAvailability/views/mentor_availability_view.dart';
import '../modules/Mentor/MentorEducationBackground/bindings/mentor_education_background_binding.dart';
import '../modules/Mentor/MentorEducationBackground/views/mentor_education_background_view.dart';
import '../modules/Mentor/mentorProfile/bindings/mentor_profile_binding.dart';
import '../modules/Mentor/mentorProfile/views/mentor_profile_view.dart';
import '../modules/Mentor/scheduleMeetings/bindings/schedule_meetings_binding.dart';
import '../modules/Mentor/scheduleMeetings/views/schedule_meetings_view.dart';
import '../modules/MentorMatched/bindings/mentor_matched_binding.dart';
import '../modules/MentorMatched/views/mentor_matched_view.dart';
import '../modules/MentorProfileInformation/bindings/mentor_profile_information_binding.dart';
import '../modules/MentorProfileInformation/views/mentor_profile_information_view.dart';
import '../modules/connections/bindings/connections_binding.dart';
import '../modules/connections/views/connections_view.dart';
import '../modules/createNewPassword/bindings/create_new_password_binding.dart';
import '../modules/createNewPassword/views/create_new_password_view.dart';
import '../modules/findingBestMatch/bindings/finding_best_match_binding.dart';
import '../modules/findingBestMatch/views/finding_best_match_view.dart';
import '../modules/forgetPassword/bindings/forget_password_binding.dart';
import '../modules/forgetPassword/views/forget_password_view.dart';
import '../modules/jobApplicationForm/bindings/job_application_form_binding.dart';
import '../modules/jobApplicationForm/views/job_application_form_view.dart';
import '../modules/navigationBar/bindings/navigation_bar_binding.dart';
import '../modules/navigationBar/views/navigation_bar_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.CAREER_GOALS,
      page: () => const CareerGoalsView(),
      binding: CareerGoalsBinding(),
    ),
    GetPage(
      name: _Paths.SKILLS,
      page: () => const SkillsView(),
      binding: SkillsBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATION,
      page: () => const EducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.PREFERRED_MENTOR,
      page: () => const PreferredMentorView(),
      binding: PreferredMentorBinding(),
    ),
    GetPage(
      name: _Paths.AVAILBILITY,
      page: () => const AvailbilityView(),
      binding: AvailbilityBinding(),
    ),
    GetPage(
      name: _Paths.CONGRATULATIONS,
      page: () => const CongratulationsView(),
      binding: CongratulationsBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.MEETINGS,
      page: () => const MeetingsView(),
      binding: MeetingsBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FIND_MENTORS,
      page: () => const FindMentorsView(),
      binding: FindMentorsBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_PROFILE,
      page: () => const MentorProfileView(),
      binding: MentorProfileBinding(),
    ),
    GetPage(
      name: _Paths.POST_QUESTIONS,
      page: () => const PostQuestionsView(),
      binding: PostQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_AND_ANSWER_FORUM,
      page: () => const QuestionAndAnswerForumView(),
      binding: QuestionAndAnswerForumBinding(),
    ),
    GetPage(
      name: _Paths.POSTED_JOBS,
      page: () => const PostedJobsView(),
      binding: PostedJobsBinding(),
    ),
    GetPage(
      name: _Paths.JOB_DETAILS,
      page: () => const JobDetailsView(),
      binding: JobDetailsBinding(),
    ),
    GetPage(
      name: _Paths.INMEETING_SCREEN,
      page: () => const InmeetingScreenView(),
      binding: InmeetingScreenBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_SESSION,
      page: () => const ScheduleSessionView(),
      binding: ScheduleSessionBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => const MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.APP_GUIDE,
      page: () => const AppGuideView(),
      binding: AppGuideBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_EDUCATION_BACKGROUND,
      page: () => const MentorEducationBackgroundView(),
      binding: MentorEducationBackgroundBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_AVAILABILITY,
      page: () => const MentorAvailabilityView(),
      binding: MentorAvailabilityBinding(),
    ),
    GetPage(
      name: _Paths.CONNECTIONS,
      page: () => const ConnectionsView(),
      binding: ConnectionsBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_MEETINGS,
      page: () => ScheduleMeetingsView(),
      binding: ScheduleMeetingsBinding(),
    ),
    GetPage(
      name: _Paths.FINDING_BEST_MATCH,
      page: () => const FindingBestMatchView(),
      binding: FindingBestMatchBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_MATCHED,
      page: () => const MentorMatchedView(),
      binding: MentorMatchedBinding(),
    ),
    GetPage(
      name: _Paths.JOB_APPLICATION_FORM,
      page: () => const JobApplicationFormView(),
      binding: JobApplicationFormBinding(),
    ),
    GetPage(
      name: _Paths.MENTOR_PROFILE_INFORMATION,
      page: () => const MentorProfileInformationView(),
      binding: MentorProfileInformationBinding(),
    ),
  ];
}
