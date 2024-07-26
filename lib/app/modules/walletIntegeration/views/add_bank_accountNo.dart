import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/wallet_controller.dart';
import 'package:mentor_app/app/modules/walletIntegeration/views/add_bank_details.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AddBankAccountNoDetails extends GetView<WalletController> {
  const AddBankAccountNoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        controller.bankAccountNumber.value.clear();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: whitecolor,
          surfaceTintColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                controller.bankAccountNumber.value.clear();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Withdrawal methods ',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.heightBox,
                  Text(
                    "Set up withdrawals: Direct to local bank",
                    style: manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                  10.heightBox,
                  Text(
                    "Send funds directly to your bank.",
                    style: manoropeFontFamily(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: darkgreyColor),
                  ),
                  40.heightBox,
                  Text(
                    "Bank Information",
                    style: manoropeFontFamily(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                  10.heightBox,
                  TextField(
                    maxLines: null, // Allow multiple lines of text
                    minLines: 1,
                    controller: controller.bankAccountNumber.value,
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: CustomButton(
                    buttonName: "Add",
                    onPressed: () {
                      if (controller.bankAccountNumber.value.text.isEmpty) {
                        Utils.snakbar(
                            title: 'Opps',
                            body:
                                'please enter your bank account number first.');
                      } else {
                        Get.to(() => const AddBankDetails());
                      }
                    },
                    textcolor: whitecolor,
                    loading: false,
                    backgroundColor: darkBrownColor,
                    rounded: true,
                    height: 50,
                    textSize: 15,
                    width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
