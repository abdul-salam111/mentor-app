import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/resources/colors.dart';



//Common button used throughout the app
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      required this.textcolor,
      required this.loading,
      required this.backgroundColor,
      required this.rounded,
      required this.height,
      required this.textSize,
      required this.width});
  final Callback onPressed;
  final String buttonName;
  final Color textcolor;
  final double textSize;
  final bool loading;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final bool? rounded;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: rounded == true
            ? const StadiumBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
        backgroundColor: backgroundColor,
        minimumSize: Size(width!, height!),
      ),
      //check if the condition is true, loader will be shown else text
      child: loading
          ? SpinKitCircle(
              size: 30.sp,
              color: whitecolor,
            )
          : Text(
              buttonName,
              style: GoogleFonts.poppins(
                  color: textcolor,
                  fontWeight: FontWeight.w400,
                  fontSize: textSize.sp),
            ),
    );
  }
}
