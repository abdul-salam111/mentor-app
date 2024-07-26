import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/elevatedButton.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/fetch_earnings_controller.dart';
import 'package:mentor_app/app/modules/walletIntegeration/views/get_paid_screen.dart';
import 'package:mentor_app/app/repositories/wallet_repo.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class GetEarningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FetchEarningsController controller =
        Get.put(FetchEarningsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whitecolor,
        surfaceTintColor: whitecolor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Earning Details',
          style:
              GoogleFonts.manrope(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.noRecordsFound.value) {
          return Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Overview'),
                    20.heightBox,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'In Escrow',
                              style: TextStyle(color: darkBrownColor),
                            ),
                            Text('\$0'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Available',
                              style: TextStyle(color: darkBrownColor),
                            ),
                            Text('\$0'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Review',
                              style: TextStyle(color: darkBrownColor),
                            ),
                            Text('\$0'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          );
        } else {
          return Padding(
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
                              'In Escrow',
                              style: TextStyle(color: darkBrownColor),
                            ),
                            Text(
                                '\$${controller.earnings.value.inEscrow.toStringAsFixed(2)}'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Available',
                              style: TextStyle(color: darkBrownColor),
                            ),
                            Text(
                                '\$${controller.earnings.value.available.toStringAsFixed(2)}'),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Review',
                              style: TextStyle(color: darkBrownColor),
                            ),
                            Text(
                                '\$${controller.earnings.value.review.toStringAsFixed(2)}'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                CustomButton(
                  buttonName: "Transaction",
                  onPressed: () {
                    Get.to(() => GetPaidScreen(
                        amount: controller.earnings.value.available
                            .toStringAsFixed(2)));
                    //  WalletRepo().withDrawAvailableAmount(
                    //   context: context,
                    //   amount: controller.earnings.value.available.toString());
                  },
                  textcolor: whitecolor,
                  loading: false,
                  backgroundColor: darkBrownColor,
                  rounded: true,
                  height: 50,
                  textSize: 15,
                  width: double.infinity,
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
