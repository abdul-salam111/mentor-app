import 'package:get/get.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () async {
      if (StorageServices.to.getString(usertoken).isNotEmpty) {
        ZegoUIKitPrebuiltCallInvitationService().init(
          appID: 555496812 /*input your AppID*/,
          appSign:
              "fd93f89ac4205aa5b7ebbdb386693b6de38e8f153bb41cfcc283cad5565e86b0" /*input your AppSign*/,
          userID: StorageServices.to.getString(selectedUserType) == "Mentee"
              ? getMenteeInfoFromJson(
                      StorageServices.to.getString(getmenteeinfo))
                  .email
              : getMentorInfoFromJson(
                      StorageServices.to.getString(getMentorInformationsss))
                  .email,
          userName: StorageServices.to.getString(userName).isEmpty
              ? "Userame"
              : StorageServices.to.getString(userName),
          plugins: [ZegoUIKitSignalingPlugin()],
        );
        Get.offAllNamed(Routes.NAVIGATION_BAR);
      } 
      else{
         Get.offAllNamed(Routes.SIGNIN);
      }
      // else if (StorageServices.to.getbool('getStartedSeen') == true) {
      //   Get.offAllNamed(Routes.SIGNIN);
      // }
      //  else {
      //   Get.offAllNamed(Routes.GET_STARTED);
      // }
    });
  }
}
