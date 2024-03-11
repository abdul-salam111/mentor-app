import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
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
            'Privacy Policy',
            style: GoogleFonts.manrope(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: textfieldgrey),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: pad20,
          child: ListView(
            children: [
              20.heightBox,
              Text(
                "1. Types data we collect",
                style: poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: blackcolor),
              ),
              10.heightBox,
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
                  style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      color: blackcolor,
                      fontWeight: FontWeight.w400)),
              30.heightBox,
              Text(
                "2. Use of your personal data",
                style: poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: blackcolor),
              ),
              10.heightBox,
              Text(
                  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
                  style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      color: blackcolor,
                      fontWeight: FontWeight.w400)),
             30.heightBox,
              Text(
                "3. Disclosure of your personal data",
                style: poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: blackcolor),
              ),
              10.heightBox,
              Text(
                  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.\n\nEt harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\n\nTemporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus",
                  style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      color: blackcolor,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ));
  }
}
