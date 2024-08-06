import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/commonWidgets/formateTime.dart';
import 'package:mentor_app/app/commonWidgets/manoropeFontFamily.dart';
import 'package:mentor_app/app/commonWidgets/shimmerEffect.dart';
import 'package:mentor_app/app/models/notifications/getnotificationsResponseModel.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
        backgroundColor: whitecolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whitecolor,
          surfaceTintColor: whitecolor,
          // leading: IconButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          title: Text(
            'Notifications',
            style: GoogleFonts.manrope(
                fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: FutureBuilder<GetNotificationResponseModel>(
            future: controller.getNotifications(),
            builder: (context,
                AsyncSnapshot<GetNotificationResponseModel>
                    getnotificationsResponseModel) {
              if (getnotificationsResponseModel.connectionState ==
                  ConnectionState.waiting) {
                print('::: 3');

                return AnotherShimmerList(10);
              } else if (!getnotificationsResponseModel.hasData) {
                print('::: 1');
                return Center(
                  child: Image.asset(
                    "assets/images/not found.jpg",
                    height: 100,
                    width: 100,
                  ),
                );
              } else if (getnotificationsResponseModel.hasError) {
                print('::: 2');

                return Center(
                  child: Text(getnotificationsResponseModel.error.toString()),
                );
              } else if (getnotificationsResponseModel.hasData) {
                return getnotificationsResponseModel
                        .data!.notifications!.isEmpty
                    ? const Center(
                        child: Text('No New Notifications'),
                      )
                    : ListView.builder(
                        itemCount: getnotificationsResponseModel
                            .data!.notifications!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    formatTime(getnotificationsResponseModel
                                        .data!.notifications![index].timestamp
                                        .toString()),
                                    style: manoropeFontFamily(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: blackcolor),
                                  )),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/browntimer.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  5.widthBox,
                                  SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      getnotificationsResponseModel
                                          .data!.notifications![index].message!,
                                      style: manoropeFontFamily(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          color: blackcolor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                              .box
                              .padding(pad16)
                              .margin(const EdgeInsets.fromLTRB(20, 10, 20, 0))
                              .rounded
                              .outerShadow
                              .white
                              .make();
                        });
              }
              return SizedBox();
            }));
  }
}
