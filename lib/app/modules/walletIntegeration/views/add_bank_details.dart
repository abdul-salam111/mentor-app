import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/wallet_controller.dart';
import 'package:mentor_app/app/modules/walletIntegeration/views/country_drop_down.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AddBankDetails extends GetView<WalletController> {
  const AddBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Add Details',
          style:
              GoogleFonts.manrope(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account Holder",
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackcolor),
            ),
            10.heightBox,
            TextField(
              maxLines: null, // Allow multiple lines of text
              minLines: 1,
              controller: controller.nameDescriptionController.value,
              style: manoropeFontFamily(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff656466)),
              decoration: InputDecoration(
                  hintText: 'Add Bank Account Number', // Your hint text
                  hintStyle: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: darkgreyColor),
                  contentPadding: const EdgeInsets.only(
                      top: 12.0, left: 12.0), // Padding from top and left
                  border: InputBorder.none),
            ).box.color(const Color(0xffF4F4F4)).roundedSM.make(),
            10.heightBox,
            Text(
              "Postal Code",
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackcolor),
            ),
            10.heightBox,
            TextField(
              maxLines: null, // Allow multiple lines of text
              minLines: 1,
              controller: controller.postalCodeController.value,
              style: manoropeFontFamily(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff656466)),
              decoration: InputDecoration(
                  hintText: 'Add Bank Account Number', // Your hint text
                  hintStyle: manoropeFontFamily(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: darkgreyColor),
                  contentPadding: const EdgeInsets.only(
                      top: 12.0, left: 12.0), // Padding from top and left
                  border: InputBorder.none),
            ).box.color(const Color(0xffF4F4F4)).roundedSM.make(),
            10.heightBox,
            Text(
              "Full Address",
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackcolor),
            ),
            10.heightBox,
            TextField(
              maxLines: null, // Allow multiple lines of text
              minLines: 1,
              controller: controller.adressController.value,
             style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff656466)),
                    decoration: InputDecoration(
                        hintText: 'Add Bank Account Number', // Your hint text
                        hintStyle: manoropeFontFamily(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: darkgreyColor),
                        contentPadding: const EdgeInsets.only(
                            top: 12.0, left: 12.0), // Padding from top and left
                        border: InputBorder.none),
                  ).box.color(const Color(0xffF4F4F4)).roundedSM.make(),
            10.heightBox,
            Text(
              "Phone number",
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackcolor),
            ),
            10.heightBox,
            TextField(
              maxLines: null, // Allow multiple lines of text
              minLines: 1,
              controller: controller.phoneNoContoller.value,
              style: manoropeFontFamily(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff656466)),
                    decoration: InputDecoration(
                        hintText: 'Add Bank Account Number', // Your hint text
                        hintStyle: manoropeFontFamily(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: darkgreyColor),
                        contentPadding: const EdgeInsets.only(
                            top: 12.0, left: 12.0), // Padding from top and left
                        border: InputBorder.none),
                  ).box.color(const Color(0xffF4F4F4)).roundedSM.make(),
            10.heightBox,
            Text(
              "Select Country",
              style: manoropeFontFamily(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackcolor),
            ),
            10.heightBox,
            CountryDropdown(),
            100.heightBox,
            CustomButton(
                buttonName: "Add",
                onPressed: () {
                  controller.addBankDetails(context);
                },
                textcolor: whitecolor,
                loading: false,
                backgroundColor: darkBrownColor,
                rounded: true,
                height: 50,
                textSize: 15,
                width: double.infinity),
          ],
        ),
      ),
    );
  }
}
