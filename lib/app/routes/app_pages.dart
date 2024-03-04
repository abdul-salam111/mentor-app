import 'package:get/get.dart';

import '../modules/PostQuestions/bindings/post_questions_binding.dart';
import '../modules/PostQuestions/views/post_questions_view.dart';
import '../modules/QuestionAndAnswerForum/bindings/question_and_answer_forum_binding.dart';
import '../modules/QuestionAndAnswerForum/views/question_and_answer_forum_view.dart';
import '../modules/availbility/bindings/availbility_binding.dart';
import '../modules/availbility/views/availbility_view.dart';
import '../modules/careerGoals/bindings/career_goals_binding.dart';
import '../modules/careerGoals/views/career_goals_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/congratulations/bindings/congratulations_binding.dart';
import '../modules/congratulations/views/congratulations_view.dart';
import '../modules/education/bindings/education_binding.dart';
import '../modules/education/views/education_view.dart';
import '../modules/findMentors/bindings/find_mentors_binding.dart';
import '../modules/findMentors/views/find_mentors_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inmeetingScreen/bindings/inmeeting_screen_binding.dart';
import '../modules/inmeetingScreen/views/inmeeting_screen_view.dart';
import '../modules/jobDetails/bindings/job_details_binding.dart';
import '../modules/jobDetails/views/job_details_view.dart';
import '../modules/meetings/bindings/meetings_binding.dart';
import '../modules/meetings/views/meetings_view.dart';
import '../modules/mentorProfile/bindings/mentor_profile_binding.dart';
import '../modules/mentorProfile/views/mentor_profile_view.dart';
import '../modules/navigationBar/bindings/navigation_bar_binding.dart';
import '../modules/navigationBar/views/navigation_bar_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/postedJobs/bindings/posted_jobs_binding.dart';
import '../modules/postedJobs/views/posted_jobs_view.dart';
import '../modules/preferredMentor/bindings/preferred_mentor_binding.dart';
import '../modules/preferredMentor/views/preferred_mentor_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/scheduleSession/bindings/schedule_session_binding.dart';
import '../modules/scheduleSession/views/schedule_session_view.dart';
import '../modules/skills/bindings/skills_binding.dart';
import '../modules/skills/views/skills_view.dart';

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
  ];
}
