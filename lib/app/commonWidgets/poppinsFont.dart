
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
//font family used througout the app
TextStyle poppins(
    {required double fontSize,
    required FontWeight fontWeight,
    required Color color}) {
  return GoogleFonts.manrope(
      fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
}