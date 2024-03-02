import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/resources/colors.dart';

Widget customSearchTextField() {
  return TextField(
    style:manoropeFontFamily(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
    decoration: InputDecoration(
      focusedBorder:const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: textfieldgrey,width: 2)), 
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: greyColor)),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: greyColor)),
        contentPadding: const EdgeInsets.only(left: 10),
        hintText: "Search for mentors",
        hintStyle: manoropeFontFamily(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: textfieldgrey),
        suffixIcon: const Icon(
          Icons.search,
          color: textfieldgrey,
        )),
  );
}
