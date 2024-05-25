import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
final controller=Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          backgroundColor: whitecolor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Purchase an additional question',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
                  child:
                   Column(
                    children: [
                      10.heightBox,
                      Text(
                        "We appreciate your interest in our service. We offer 5 questions for free. After that, there is a \$5 fee to upload additional questions. Thank you for understanding. ",
                        style: manoropeFontFamily(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff656466)),
                        textAlign: TextAlign.center,
                      ),
                      5.heightBox,
                      Text(
                        '\$5',
                        style: manoropeFontFamily(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: darkBrownColor),
                      ),
                      10.heightBox,
                      CustomButton(
                          buttonName: "Purchase An Additional Question",
                          onPressed: () async {
                           await controller
                                .makePayment(amount: '5')
                                .then((value) {
                                  
                                });
                          },
                          textcolor: blackcolor,
                          loading: false,
                          backgroundColor: const Color(0xffCCD7C5),
                          rounded: false,
                          height: 45,
                          textSize: 10.sp,
                          width: double.infinity),
                      20.heightBox,
                    ],
                  )
                    .box
                    .padding(pad14)
                    .white
                    .margin(const EdgeInsets.only(left: 18, right: 18))
                    .roundedSM
                    .outerShadow
                    .make()
                  )
              .box
              .white
              .outerShadow
              .height(250.h)
              .padding(pad16)
              .rounded
              .make(),
        ));
  }
}
