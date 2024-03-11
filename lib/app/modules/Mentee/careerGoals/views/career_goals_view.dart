import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/career_goals_controller.dart';

class CareerGoalsView extends GetView<CareerGoalsController> {
  const CareerGoalsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                "What are you career goals?",
                style: GoogleFonts.manrope(
                    fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
            ),
            10.heightBox,
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: defaultpad,
                  child: Text(
                    "maximum 5 goals",
                    style: manoropeFontFamily(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: redColor),
                  ),
                )),
            Expanded(
              child: GetBuilder<CareerGoalsController>(builder: (contextsss) {
                return ListView.builder(
                  itemCount: controller.goalsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final skill = controller.goalsList[index];
                    final isSelected =
                        controller.selectedGoalsList.contains(skill);
                    return ListTile(
                      title: Text(
                        skill,
                        style: const TextStyle(fontSize: 14),
                      ),
                      leading: Image.asset(school,height: 25,width: 25,),
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
                      if (controller.selectedGoalsList.length > 4) {
                        if (isSelected) {
                          controller.selectedGoalsList.remove(skill);
                          contextsss.update();
                        } else {
                          Utils.snakbar(
                              title: 'Maximum 5 goals',
                              body: 'You cannot select more than 5 goals.');
                        }
                      } else {
                        if (isSelected) {
                          controller.selectedGoalsList.remove(skill);
                          contextsss.update();
                        } else {
                          controller.selectedGoalsList.add(skill);
                          contextsss.update();
                        }
                      }
                    });
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: CustomButton(
                  buttonName: "Continue",
                  onPressed: () {
                  if(controller.selectedGoalsList.isNotEmpty){
                      Get.toNamed(Routes.SKILLS);
                  }
                  else{
                    Utils.snakbar(title: "Select Goals", body: "Please select at least 1 goal.");
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
