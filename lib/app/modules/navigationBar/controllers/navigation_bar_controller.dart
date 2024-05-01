import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/modules/Mentee/availbility/views/availbility_view.dart';
import 'package:mentor_app/app/modules/Mentee/chats/views/chats_view.dart';
import 'package:mentor_app/app/modules/Mentee/home/views/home_view.dart';
import 'package:mentor_app/app/modules/Mentee/meetings/views/meetings_view.dart';
import 'package:mentor_app/app/modules/Mentee/scheduleSession/views/schedule_session_view.dart';
import 'package:mentor_app/app/modules/Mentor/mentorProfile/views/mentor_profile_view.dart';
import 'package:mentor_app/app/modules/Mentor/scheduleMeetings/views/schedule_meetings_view.dart';
import 'package:mentor_app/app/modules/MentorProfileInformation/views/mentor_profile_information_view.dart';
import 'package:mentor_app/app/modules/notifications/views/notifications_view.dart';
import 'package:mentor_app/app/modules/Mentee/profile/views/profile_view.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class NavigationBarController extends GetxController {
  List<Widget> pages = [
    const HomeView(),
    // StorageServices.to.getString(selectedUserType) == "Mentee"
    //     ? const ScheduleSessionView()
    //     :  
        ScheduleMeetingsView(),
    const ChatsView(),
    const NotificationsView(),
    StorageServices.to.getString(selectedUserType) == "Mentee"
        ? const ProfileView()
        : const MentorProfileInformationView(),
  ];
  RxInt selectedIndex = 0.obs;
}
