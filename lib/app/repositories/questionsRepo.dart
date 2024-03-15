import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/models/getMenteeInfo.dart';
import 'package:mentor_app/app/models/getPostQuestionModel.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class QuestionsRepository {
  Future<GetPostQuestionModel> postQuestion(
      {required String question, required String industry}) async {
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/mentee/questions/post";

    // JSON data for the request body
    Map<String, dynamic> payload = {
      "industries": industry,
      "menteeId":
          getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).id,
      "question": question,
    };

    // Set headers
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
    };

    // Make POST request
    try {
      EasyLoading.show(status: "Uploading...");
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(payload),
      );

      // Check response status
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
  print(data);
        StorageServices.to.setString(
            key: remainingQuestions,
            value: data['remainingQuestions'].toString());
        EasyLoading.dismiss();
        return GetPostQuestionModel.fromJson(data);
      } else {
        print("Failed to post question. Status code: ${response.statusCode}");
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      print("Error: $e");

      EasyLoading.dismiss();
      throw Exception();
    }
  }
}
