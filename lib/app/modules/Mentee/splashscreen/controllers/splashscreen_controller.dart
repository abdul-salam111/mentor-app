import 'package:get/get.dart';
import 'package:mentor_app/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
  Future.delayed(const Duration(seconds: 2),(){
    Get.offAllNamed(Routes.GET_STARTED);
  });
  }

}
