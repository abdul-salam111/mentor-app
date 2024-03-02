import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/utils/grapheme_splitter.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';

import '../controllers/navigation_bar_controller.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedIconTheme: const IconThemeData(
            color: darkBrownColor,
          ),
          selectedLabelStyle: const TextStyle(color: darkBrownColor),
          unselectedIconTheme: const IconThemeData(
            color: darkgreyColor,
          ),
          unselectedLabelStyle: const TextStyle(color: darkgreyColor),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Obx(() => Image.asset(
                    home,
                    height: 20,
                    width: 20,
                    color: controller.selectedIndex.value == 0
                        ? darkBrownColor
                        : darkgreyColor,
                  )),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Obx(() => Image.asset(
                   height: 20,
                    width: 20,
                    meetings,
                    color: controller.selectedIndex.value == 1
                        ? darkBrownColor
                        : darkgreyColor,
                  )),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              icon: Obx(() => Image.asset(
                 height: 20,
                    width: 20,
                    chats,
                    color: controller.selectedIndex.value == 2
                        ? darkBrownColor
                        : darkgreyColor,
                  )),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Obx(() => Image.asset(
                    notifications,
                    color: controller.selectedIndex.value == 3
                        ? darkBrownColor
                        : darkgreyColor,
                  )),
              label: 'notifications',
            ),
            BottomNavigationBarItem(
              icon: Obx(() => Image.asset(
                    profile,
                    color: controller.selectedIndex.value == 4
                        ? darkBrownColor
                        : darkgreyColor,
                  )),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: darkBrownColor,
          iconSize: 20.sp,
          onTap: (val) {
            controller.selectedIndex.value = val;
          },
          elevation: 0,
        ),
      ),
      body:
          Obx(() => controller.pages.elementAt(controller.selectedIndex.value)),
    );
  }
}
