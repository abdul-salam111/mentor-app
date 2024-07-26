import 'package:get/get.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/wallet_controller.dart';

class WalletFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(
      () => WalletController(),
    );
  }
}
