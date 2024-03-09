import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width / 1.2,
      shape: const RoundedRectangleBorder(),
      backgroundColor: whitecolor.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
        child: Column(
          crossAxisAlignment: crosstart,
          children: <Widget>[
            70.heightBox,
            Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: const AssetImage(profilepic),
                ),
                10.widthBox,
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Text(
                      "Damilola John",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                    Text(
                      "Mantee",
                      style: manoropeFontFamily(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: blackcolor),
                    ),
                  ],
                )
              ],
            ),
            20.heightBox,
            CustomButton(
                buttonName: "Edit Profile",
                onPressed: () {},
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: false,
                height: 30.h,
                textSize: 11.sp,
                width: 60),
            20.heightBox,
            Row(
              children: [
                Image.asset(
                  profileicon,
                  height: 45.h,
                  width: 45.w,
                ),
                10.widthBox,
                Text(
                  "Account",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
            10.heightBox,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    settings,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                10.widthBox,
                Text(
                  "Change Password",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ],
            ).onTap(() {
              Get.toNamed(Routes.CHANGE_PASSWORD);
            }),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
            10.heightBox,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    privacypolicy,
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
                10.widthBox,
                Text(
                  "Privacy Policy",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ],
            ).onTap(() {
              Get.toNamed(Routes.PRIVACY_POLICY);
            }),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
            10.heightBox,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    deleteicon,
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
                10.widthBox,
                Text(
                  "Deactivate Account",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
             10.heightBox,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    appguide,
                    height: 18.h,
                    width: 18.w,
                  ),
                ),
                10.widthBox,
                Text(
                  "App Guide",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ],
            ).onTap(() {
              Get.toNamed(Routes.APP_GUIDE);
            }),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
            40.heightBox,
          
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    logouticon,
                    height: 27.h,
                    width: 27.w,
                  ),
                ),
                10.widthBox,
                Text(
                  "Logout",
                  style: manoropeFontFamily(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: blackcolor),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 8),
              child: Divider(
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
