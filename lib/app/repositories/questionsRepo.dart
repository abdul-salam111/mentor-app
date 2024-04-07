import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/questions/getPostQuestionModel.dart';
import 'package:mentor_app/app/models/questions/getallQuestions.dart';
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

        StorageServices.to.setString(
            key: remainingQuestions,
            value: data['remainingQuestions'].toString());
        await fetchQuestionCount();
        Utils.snakbar(
            title: "Question Uploaded",
            body:
                "Remaining questions are ${(StorageServices.to.getString(remainingQuestions))}");
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

  Future<void> fetchQuestionCount() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://guided-by-culture-production.up.railway.app/api/mentee/get-question-count/${getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).email}'),
          headers: {
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await StorageServices.to.setString(
            key: remainingQuestions, value: (data['questionCount']).toString());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
    }
  }

  //fetch questions
  Future<GetQuestionModel> fetchAllQuestion({required String industry}) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://guided-by-culture-production.up.railway.app/api/mentee/questions/industry/$industry'),
          headers: {
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GetQuestionModel.fromJson(data);
      } else {
        print(response.body);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }

  //post question replies
  Future<GetQuestionModel> submitAnswersToQuestions(
      {required String answer,
      required String menteeQuestionId,
      required String mentorQuestionId}) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://guided-by-culture-production.up.railway.app/api/mentee/questions/industry'),
          headers: {
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GetQuestionModel.fromJson(data);
      } else {
        print(response.body);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }
}
