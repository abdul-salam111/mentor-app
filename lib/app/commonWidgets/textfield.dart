import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';


//search field used throughout the app
Widget customSearchTextField({String hinttext="Search for mentors"}) {
  return TextField(

    style: manoropeFontFamily(
        fontSize: 14.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
    decoration: InputDecoration(
        focusedBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: greyColor.withOpacity(0.5), width: 2)),
        enabledBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color:greyColor.withOpacity(0.5))),
        border:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: greyColor.withOpacity(0.5))),
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: hinttext,
        hintStyle: manoropeFontFamily(
            fontSize: 12.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
        suffixIcon: const Icon(
          Icons.search,
          color: textfieldgrey,
        )),
  );
}
