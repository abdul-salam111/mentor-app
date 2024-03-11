
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/repositories/authRepo.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class HomeController extends GetxController {
AuthRepository authRepository =AuthRepository();
Future<void> logoutUser()async{
  EasyLoading.show(status: "Logging out");
  authRepository.logoutUser().then((value){
     EasyLoading.dismiss();
    StorageServices.to.remove(usertoken);
    Get.offAllNamed(Routes.SIGNIN);
  });
}

}
