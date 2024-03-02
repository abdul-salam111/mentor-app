import 'package:get/get.dart';

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
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/meetings/bindings/meetings_binding.dart';
import '../modules/meetings/views/meetings_view.dart';
import '../modules/navigationBar/bindings/navigation_bar_binding.dart';
import '../modules/navigationBar/views/navigation_bar_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/preferredMentor/bindings/preferred_mentor_binding.dart';
import '../modules/preferredMentor/views/preferred_mentor_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
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
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
