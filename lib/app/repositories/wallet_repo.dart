import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/payment/fetch_mentor_earnings_model.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class WalletRepo {
  Future<void> addBankDetails(
      {dynamic data, required BuildContext context}) async {
    print('::: WalletRepo $data');
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/mentors/add-bank-details";

    // Set headers
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    try {
      EasyLoading.show(status: "Uploading...");

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      if (kDebugMode) {
        print('::: ${response.statusCode}');
        print(':::WalletRepo=> addBankDetails: ${response.body}');
      }

      if (response.statusCode == 200) {
        _showAlertDialog(context);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(':::Exception $e');
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      constraints: BoxConstraints(
                          maxHeight: context.height / 8,
                          maxWidth: context.width / 6),
                      child: Image.asset(
                        'assets/icons/doneicon.png',
                        color: const Color(0xFF00C337),
                      )),
                  20.heightBox,
                  const Text('Bank Details Added.',
                      style: TextStyle(color: Color(0xFF00C337))),
                ]),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('OK', style: TextStyle(color: Color(0xFF00C337))),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> fetchPaymentDetials() async {
    print(
        '::: mentor id while adding bank details ${StorageServices.to.getString(userId)}');
    try {
      final response = await http.get(Uri.parse(
          // 'https://guided-by-culture-production.up.railway.app/api/payment/getPaymentDetails/${StorageServices.to.getString(userId)}'));
      'https://guided-by-culture-production.up.railway.app/api/payment/getPaymentDetails/100'));
      print('::: res ${response.body}');
      print('::: res ${response.statusCode}');
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['responseCode'] == '200') {
          return FetchMentorEarningsModel.fromJson(jsonData['data']);
        } else if (jsonData['responseCode'] == '404') {
          print('::: No records found');
          return FailedFetchMentorEarningsModel();
        } else {
          throw Exception('Unexpected response code');
        }
      } else {
        print(response.body);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }

  Future<void> withDrawAvailableAmount({required BuildContext context}) async {
    var mentorId = StorageServices.to.getString(userId);
    print('::: mentor id in completeTransaction $mentorId');
    dynamic data = {'mentorId': mentorId};
    print('::: withDrawAvailableAmount $data');
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/payment/withdraw";

    try {
      EasyLoading.show(status: "Loading...");

      final response = await http.post(
        headers: {'Content-Type': 'application/json'},
        Uri.parse(url),
        body: jsonEncode(data),
      );
      print('::: ${response.body}');
      print('::: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        Utils.snakbar(title: 'Success', body: jsonData['responseDesc']);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        final jsonData = json.decode(response.body);
        Utils.snakbar(title: 'Opps', body: jsonData['responseDesc']);

        throw Exception();
      }
    } catch (e) {
      Utils.snakbar(title: 'Opps', body: e.toString());

      EasyLoading.dismiss();
      print(':::Exception $e');
    } finally {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  // Future<void> completeTransaction({required BuildContext context}) async {
  //   var mentorId = StorageServices.to.getString(userId);
  //   print('::: mentor id in completeTransaction $mentorId');
  //   dynamic data = {'mentorId': mentorId};
  //   print('::: completeTransaction $data');
  //   // Endpoint URL
  //   String url =
  //       "https://guided-by-culture-production.up.railway.app/api/payment/complete-transaction";
  //   try {
  //     EasyLoading.show(status: "Loading...");
  //     final response = await http.post(
  //       headers: {'Content-Type': 'application/json'},
  //       Uri.parse(url),
  //       body: jsonEncode(data),
  //     );
  //     print('::: ${response.body}');
  //     print('::: ${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       final jsonData = json.decode(response.body);
  //       Utils.snakbar(title: 'Success', body: jsonData['responseDesc']);
  //       EasyLoading.dismiss();
  //     } else {
  //       EasyLoading.dismiss();
  //       final jsonData = json.decode(response.body);
  //       Utils.snakbar(title: 'Opps', body: jsonData['responseDesc']);
  //       throw Exception();
  //     }
  //   } catch (e) {
  //     Utils.snakbar(title: 'Opps', body: e.toString());
  //     EasyLoading.dismiss();
  //     print(':::Exception $e');
  //   } finally {
  //     Navigator.pop(context);
  //     Navigator.pop(context);
  //     Navigator.pop(context);
  //   }
  // }

  // mentee => select slot then pay to book the slot
  Future<void> purchase(
      {required BuildContext context, required dynamic data}) async {
    // dynamic data = {'mentorId': StorageServices.to.getString(userId)};

    print('::: purchase $data');
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/payment/purchase";

    try {
      EasyLoading.show(status: "Loading...");

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
      );
      print('::: ${response.body}');
      print('::: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        Utils.snakbar(title: 'Success', body: jsonData['responseDesc']);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        final jsonData = json.decode(response.body);
        Utils.snakbar(title: 'Opps', body: jsonData['responseDesc']);

        throw Exception();
      }
    } catch (e) {
      Utils.snakbar(title: 'Opps', body: e.toString());

      EasyLoading.dismiss();
      print(':::Exception $e');
    } finally {
      Get.offAllNamed(Routes.NAVIGATION_BAR);
    }
  }

  // mentee => when meeting is completed
  Future<void> meetingCompleted(
      {required BuildContext context, required dynamic data}) async {
    dynamic data = {'mentorId': StorageServices.to.getString(userId)};

    print('::: purchase $data');
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/payment/purchase";

    try {
      EasyLoading.show(status: "Loading...");

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
      );
      print('::: ${response.body}');
      print('::: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        Utils.snakbar(title: 'Success', body: jsonData['responseDesc']);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        final jsonData = json.decode(response.body);
        Utils.snakbar(title: 'Opps', body: jsonData['responseDesc']);

        throw Exception();
      }
    } catch (e) {
      Utils.snakbar(title: 'Opps', body: e.toString());

      EasyLoading.dismiss();
      print(':::Exception $e');
    } finally {}
  }
}
