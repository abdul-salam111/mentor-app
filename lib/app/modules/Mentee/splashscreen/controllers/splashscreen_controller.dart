import 'package:get/get.dart';
import 'package:mentor_app/app/models/getMenteeInfo.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      if (StorageServices.to.getString(usertoken).isNotEmpty) {
        ZegoUIKitPrebuiltCallInvitationService().init(
          appID: 2109043297 /*input your AppID*/,
          appSign:
              "3bbeed7104952626f4b5f8a30d0089e9442d9a05872113beb24d457d91498fdb" /*input your AppSign*/,
          userID:
              getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                  .email!,
          userName:
              getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo))
                      .fullName ??
                  "Hello",
          plugins: [ZegoUIKitSignalingPlugin()],
        );
        Get.offAllNamed(Routes.NAVIGATION_BAR);
      } else {
        Get.offAllNamed(Routes.GET_STARTED);
      }
    });
  }
}
