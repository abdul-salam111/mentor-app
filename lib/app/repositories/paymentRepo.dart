import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';
class PaymentRepository{
  Future<void> createPayment(
      {required double amount}) async {
        print(amount);
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/mentee/payment/create";

    // JSON data for the request body
    Map<String, dynamic> payload = {
      "amount": 5,
      "menteeId":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).id,
      "paymentMethod": "Stripe",
      "paymentReason": "To post more questions."
    };

    // Set headers
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
    };

    // Make POST request
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(payload),
      );

      // Check response status
      if (response.statusCode == 200) {
        print("Payment created successfully!");
      } else {
        print("Failed to create payment. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}