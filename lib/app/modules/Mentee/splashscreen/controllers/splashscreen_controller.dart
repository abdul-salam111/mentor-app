import 'package:get/get.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () async {
      if (StorageServices.to.getString(usertoken).isNotEmpty) {
        ZegoUIKitPrebuiltCallInvitationService().init(
          appID: 501015063 /*input your AppID*/,
          appSign:
              "6b2c3129f696ea42de0450c0f8b2edd5c127a9c3fe60e103098fa680ee0fb55d" /*input your AppSign*/,
          userID: StorageServices.to.getString(selectedUserType) == "Mentee"
              ? getMenteeInfoFromJson(
                      StorageServices.to.getString(getmenteeinfo))
                  .email
              : getMentorInfoFromJson(
                      StorageServices.to.getString(getMentorInformationsss))
                  .email,
          userName:StorageServices.to.getString(selectedUserType) == "Mentee"?
              getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                      .email 
                  :getMentorInfoFromJson(
                      StorageServices.to.getString(getMentorInformationsss))
                  .fullName,
          plugins: [ZegoUIKitSignalingPlugin()],
        );
        Get.offAllNamed(Routes.NAVIGATION_BAR);
      } else {
        Get.offAllNamed(Routes.GET_STARTED);
      }
    });
  }
}
