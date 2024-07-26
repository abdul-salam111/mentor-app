import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mentor_app/app/models/payment/fetch_mentor_earnings_model.dart';
import 'package:mentor_app/app/modules/walletIntegeration/controllers/country_controller.dart';
import 'package:mentor_app/app/repositories/wallet_repo.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class WalletController extends GetxController {
  final nameDescriptionController = TextEditingController().obs;
  final postalCodeController = TextEditingController().obs;
  final adressController = TextEditingController().obs;
  final phoneNoContoller = TextEditingController().obs;
  final bankAccountNumber = TextEditingController().obs;
  var selectCountry = "Select a country".obs;

  WalletRepo walletRepository = WalletRepo();

  Future addBankDetails(BuildContext context) async {
    print(
        '::: mentor id while adding bank details${StorageServices.to.getString(userId)}}');
    await walletRepository.addBankDetails(context: context, data: {
      "mentorId": StorageServices.to.getString(userId),
      "bankAccountNumber": bankAccountNumber.value.text.toString(),
      'accountHolderName': nameDescriptionController.value.text.toString(),
      'postalCode': postalCodeController.value.text.toString(),
      'fullAddress': adressController.value.text.toString(),
      'phoneNumber': phoneNoContoller.value.text.toString(),
      'country': Get.find<CountryController>().selectedCountry.value,
    }).then((value) {
      nameDescriptionController.value.clear();
      postalCodeController.value..clear();
      adressController.value.clear();
      phoneNoContoller.value..clear();
    });
  }

  @override
  void onClose() {
    super.onClose();
    bankAccountNumber.value.clear();
  }
}
