import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mentor_app/app/commonWidgets/poppinsFont.dart';
import 'package:mentor_app/app/resources/colors.dart';

import 'package:velocity_x/velocity_x.dart';

Widget commonTextField({required String icon, required String hinttext,required TextEditingController textEditingController,  bool obscureText=false}) {
  return TextField(
    obscureText:obscureText ,
    controller: textEditingController,
    cursorHeight: 15.h,
    style: poppins(
        fontSize: 12.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
    decoration: InputDecoration(
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      border: InputBorder.none,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: SizedBox(
          height: 20,
          width: 30,
          child: Image.asset(
            icon,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
      hintText: hinttext,
      filled: true,
      fillColor: const Color(0xffF0F0F0),
      hintStyle: poppins(
          fontSize: 11.sp, fontWeight: FontWeight.w400, color: textfieldgrey),
    ),
  ).box.rounded.clip(Clip.antiAlias).make();
}
