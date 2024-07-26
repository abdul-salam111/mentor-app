import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/modules/payment/controllers/payment_schedule_controller.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/wallet_controller.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/icons.dart';
import 'package:velocity_x/velocity_x.dart';

class PayToBookSlotForMeeting extends GetView<PaymentScheduleController> {
  final name;
  final numOfMeetingHours;

  final mentorId;

  final menteeId;

  final bookingId;

  final inEscrowAmount;

  const PayToBookSlotForMeeting({
    super.key,
    required this.name,
    required this.numOfMeetingHours,
    required this.mentorId,
    required this.menteeId,
    required this.bookingId,
    required this.inEscrowAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  40.heightBox,
                  const Icon(
                    Icons.watch_later_outlined,
                    color: darkBrownColor,
                  ),
                  10.heightBox,
                  Text(
                    "You are booking with $name",
                    style: manoropeFontFamily(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: blackcolor),
                  ),
                  40.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking Summary",
                        style: manoropeFontFamily(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: blackcolor),
                      ),
                      Text(
                        "$numOfMeetingHours booking",
                        style: manoropeFontFamily(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: blackcolor),
                      ),
                    ],
                  ),
                  10.heightBox,
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Color(0xffF4F4F4),
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sub Total'),
                        Text('\$$inEscrowAmount')
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: CustomButton(
                    buttonName: "Confirm Payment",
                    onPressed: () {
                      print(
                          'Confirm Payment button :inEscrowAmount ${inEscrowAmount} \n mentorId : $mentorId ,menteeId:  $menteeId ');
                      controller.makePayment(
                          // amount: inEscrowAmount.toString(),
                          amount: getIntegerPart(inEscrowAmount).toString(),
                          context: context,
                          data: {
                            "mentorId": mentorId,
                            "menteeId": menteeId,
                            "bookingId": bookingId,
                            // "inEscrowAmount": inEscrowAmount.toString()
                            "inEscrowAmount": getIntegerPart(inEscrowAmount)
                          });
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

  int getIntegerPart(double value) {
    return value.toInt();
  }
}
