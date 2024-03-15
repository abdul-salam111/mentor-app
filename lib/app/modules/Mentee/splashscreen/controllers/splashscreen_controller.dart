import 'package:get/get.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      if (StorageServices.to.getString(usertoken).isNotEmpty) {
        Get.offAllNamed(Routes.NAVIGATION_BAR);
      }
      else{
         Get.offAllNamed(Routes.GET_STARTED);
      }
    });
  }
}
