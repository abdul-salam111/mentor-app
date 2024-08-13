import 'package:get/get.dart';

import '../resources/colors.dart';


//snakbar used in app
class Utils {
  static snakbar({required String title, required String body}) {
    return Get.snackbar(
      title,
      body,
      backgroundColor: halfwhitecolor,
      overlayBlur: 0.8,
      snackPosition: SnackPosition.TOP,
    );
  }
}



class ZegoCloudConfig {
  static const appId = 324556300;
  static const appSign =
      "8144d977927589c426572f691704f7d65641004a06f2fd530b1d269121157ae8";
}
