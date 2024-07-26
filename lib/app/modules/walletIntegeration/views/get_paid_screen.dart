import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/repositories/wallet_repo.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class GetPaidScreen extends StatefulWidget {
  final amount;

  const GetPaidScreen({super.key, required this.amount});

  @override
  State<GetPaidScreen> createState() => _GetPaidScreenState();
}

class _GetPaidScreenState extends State<GetPaidScreen> {
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
          'Get Paid',
          style:
              GoogleFonts.manrope(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Overview'),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Available',
                          style: TextStyle(color: darkBrownColor),
                        ),
                        Text('\$${widget.amount}'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            CustomButton(
                buttonName: "Get Paid",
                onPressed: () {
                  // _showAlertDialog();
                  WalletRepo().withDrawAvailableAmount(context: context);
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

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      constraints: BoxConstraints(
                          maxHeight: context.height / 8,
                          maxWidth: context.width / 6),
                      child: Image.asset(
                        'assets/icons/doneicon.png',
                        color: const Color(0xFF00C337),
                      )),
                  20.heightBox,
                  const Text('Your request has been sent.',
                      style: TextStyle(color: Color(0xFF00C337))),
                ]),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('OK',
          //         style: TextStyle(color: Color(0xFF00C337))),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}
