import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/modules/chats/views/chats_view.dart';
import 'package:mentor_app/app/modules/home/views/home_view.dart';
import 'package:mentor_app/app/modules/meetings/views/meetings_view.dart';
import 'package:mentor_app/app/modules/notifications/views/notifications_view.dart';
import 'package:mentor_app/app/modules/profile/views/profile_view.dart';

class NavigationBarController extends GetxController {
  List<Widget> pages = [
    const HomeView(),
    const MeetingsView(),
    const ChatsView(),
    const NotificationsView(),
     ProfileView()
  ];
    RxInt selectedIndex = 0.obs;
}
