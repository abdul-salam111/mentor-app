import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../resources/images.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pad20,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  logo2,
                  width: 180.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
              40.heightBox,
              Center(
                child: Text(
                  "Enter Otp",
                  style: poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: blackcolor),
                ),
              ),
              40.heightBox,
              OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  StorageServices.to.setString(key: "otp", value: pin);
                  controller.sendOtp(otp: pin);
               
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
