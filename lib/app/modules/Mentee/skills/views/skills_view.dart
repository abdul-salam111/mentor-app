import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/modules/Mentee/skills/controllers/skills_controller.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Utils/Utils.dart';
import '../../../../commonWidgets/elevatedButton.dart';

class SkillsView extends GetView<SkillsController> {
  const SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Profile',
            style: GoogleFonts.manrope(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            10.heightBox,
            Center(
              child: Text(
                "What skills do you want to strengthen?",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
            ),
            10.heightBox,
            Expanded(
              child: GetBuilder<SkillsController>(builder: (contextsss) {
                return ListView.builder(
                  itemCount: controller.computerScienceSkills.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final skill = controller.computerScienceSkills[index];
                    final isSelected =
                        controller.selectedSkills.contains(skill);
                    return ListTile(
                      title: Text(
                        skill,
                        style: const TextStyle(fontSize: 14),
                      ),
                      leading: Image.asset(
                        skills,
                        height: 25,
                        width: 25,
                      ),
                      trailing: isSelected == true
                          ? SizedBox(
                              height: 10.h,
                              width: 10.h,
                            ).box.color(darkBrownColor).rounded.make()
                          : SizedBox(
                              height: 10.h,
                              width: 10.h,
                            ).box.border(color: darkBrownColor).rounded.make(),
                    )
                        .box
                        .margin(const EdgeInsets.all(8))
                        .color(halfwhitecolor)
                        .rounded
                        .make()
                        .onTap(() {
                      if (isSelected) {
                        controller.selectedSkills.remove(skill);
                        contextsss.update();
                      } else {
                        controller.selectedSkills.add(skill);
                        contextsss.update();
                      }
                    });
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: CustomButton(
                  buttonName: "Continue",
                  onPressed: () {
            
                    if (controller.selectedSkills.isNotEmpty &&
                        StorageServices.to.getString(selectedUserType) ==
                            'Mentee') {
                      Get.toNamed(Routes.EDUCATION);
                    } else if (controller.selectedSkills.isNotEmpty &&
                        StorageServices.to.getString(selectedUserType) ==
                            'Mentor') {
                      Get.toNamed(Routes.MENTOR_EDUCATION_BACKGROUND);
                    } else {
                      Utils.snakbar(
                          title: "Select Skills",
                          body: "Please select at least 1 skill.");
                    }
                  },
                  textcolor: whitecolor,
                  loading: false,
                  backgroundColor: darkBrownColor,
                  rounded: true,
                  height: 50,
                  textSize: 16,
                  width: double.infinity),
            ),
            20.heightBox,
          ],
        ));
  }
}
