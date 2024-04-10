import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/modules/Mentee/home/controllers/home_controller.dart';
import 'package:mentor_app/app/resources/alignments.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
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
                      StorageServices.to.getString(selectedUserType) == "Mentor"
                          ? getMentorInfoFromJson(StorageServices.to
                                  .getString(getMentorInformationsss))
                              .fullName
                          : getMenteeInfoFromJson(
                                  StorageServices.to.getString(getmenteeinfo))
                              .fullName??"John Jickey",
                      style: manoropeFontFamily(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                    Text(
                      StorageServices.to.getString(selectedUserType),
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
                onPressed: () {
                  StorageServices.to.getString(selectedUserType) == "Mentee"
                      ? Get.toNamed(Routes.PROFILE)
                      : Get.toNamed(Routes.MENTOR_PROFILE_INFORMATION);
                },
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
            GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  Container(
                    padding: pad20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: defaultpad,
                        child: Column(
                          crossAxisAlignment: crosstart,
                          children: [
                            Text(
                              'Enter Password',
                              style: manoropeFontFamily(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: textfieldgrey),
                            ),
                            10.heightBox,
                            Obx(
                              () => TextField(
                                style: manoropeFontFamily(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff656466)),
                                obscureText:
                                    homeController.passwordObsecure.value,
                                controller:
                                    homeController.passwordController.value,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          homeController
                                                  .passwordObsecure.value =
                                              !homeController
                                                  .passwordObsecure.value;
                                        },
                                        child: Icon(
                                          homeController.passwordObsecure.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: const Color(0xff656466),
                                        )),
                                    hintText: "***********",
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, top: 12),
                                    hintStyle: manoropeFontFamily(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff656466))),
                              )
                                  .box
                                  .roundedLg
                                  .clip(Clip.antiAlias)
                                  .color(const Color(0xffEFEFEF))
                                  .make(),
                            ),
                            30.heightBox,
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomButton(
                                  buttonName: "Deactivate",
                                  onPressed: () {
                                    if (homeController.passwordController.value
                                        .text.isNotEmpty) {
                                      Get.dialog(
                                        AlertDialog(
                                          title: const Text('Confirmation'),
                                          content: const Text(
                                              'Are you sure you want to delete your account?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Close'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                homeController.deleteMentee();
                                              },
                                              child: const Text('Yes'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      Utils.snakbar(
                                          title: "Enter Password",
                                          body:
                                              "Please enter password to delete your account.");
                                    }
                                  },
                                  textcolor: whitecolor,
                                  loading: false,
                                  backgroundColor: darkBrownColor,
                                  rounded: true,
                                  height: 40.h,
                                  textSize: 15.sp,
                                  width: 100.w),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Row(
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
            ).onTap(() {
              homeController.logoutUser();
            }),
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
