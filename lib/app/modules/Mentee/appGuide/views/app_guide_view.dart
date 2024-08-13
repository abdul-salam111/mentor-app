import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor_app/app/modules/Mentee/appGuide/controllers/app_guide_controller.dart';
import 'package:mentor_app/app/resources/colors.dart';
import 'package:mentor_app/app/resources/paddings.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppGuideView extends GetView<AppGuideController> {
  const AppGuideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'App Guide Tutorials',
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: pad20,
        child: FittedBox(
          child: Column(
            children: [
              // Large video player at the top
              YoutubePlayer(
                controller: controller.controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                topActions: <Widget>[
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      controller.controller.metadata.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
                onEnded: (data) {
                  controller.controller.load(
                    controller.ids[(controller.ids.indexOf(data.videoId) + 1) %
                        controller.ids.length],
                  );
                },
              ).box.rounded.clip(Clip.antiAlias).make(),
          
              // Divider
              const Divider(),
              // List of smaller video players
              Expanded(
                child: ListView.builder(
                  itemCount: controller.ids.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                            onTap: () {
                              controller.controller.load(controller.ids[index]);
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 150
                                      .w, // Limiting the width to 100 logical pixels
                                  height: 100.h,
                                  child: Image.network(
                                    'https://img.youtube.com/vi/${controller.ids[index]}/0.jpg',
                                    width:
                                        100.w, // Setting the width of the image
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    .box
                                    .rounded
                                    .margin(defaultpad)
                                    .clip(Clip.antiAlias)
                                    .make(),
                                10.widthBox,
                                SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      controller.videoTitles[index],
                                      style: TextStyle(
                                          color: blackcolor, fontSize: 16.sp),
                                    ))
                              ],
                            ))
                        .box
                        .outerShadow
                        .clip(Clip.antiAlias)
                        .rounded
                        .margin(defaultpad)
                        .color(const Color(0xffF5F5F5))
                        .make();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
