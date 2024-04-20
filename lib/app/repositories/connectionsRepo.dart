import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/authModels/getMenteeInfo.dart';
import 'package:mentor_app/app/models/connections/getMenteeConnections.dart';
import 'package:mentor_app/app/models/connections/getMentorConnections.dart';
import 'package:mentor_app/app/models/mentor/getMentorInfor.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class ConnectionsRepository {
  Future<bool> createConnection(recId, recName) async {
    try {
      print(recId);
      EasyLoading.show(status: "Sending...");
      // Make the POST request
      final response = await http.post(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connection-request/create?receiverId=${getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).id}&senderId=$recId"));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 201) {
        // Request successful, handle response data if needed

        print('Request successful');
        print('Response: ${response.body}');
        Utils.snakbar(
            title: "Request Sent",
            body: "Request sent to $recName succefully!");
        EasyLoading.dismiss();
        return true;
      } else {
        // Request failed
        EasyLoading.dismiss();
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (e) {
      // An error occurred
      EasyLoading.dismiss();

      print('Error making POST request: $e');
      return false;
    }
  }

  Future<bool> cancelConnection(recId, recName) async {
    try {
      EasyLoading.show(status: "Sending...");
      // Make the POST request
      final response = await http.post(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connection-request/create?receiverId=${getMenteeInfoFromJson(StorageServices.to.getString(getmenteeinfo)).id}&senderId=$recId"));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 201) {
        // Request successful, handle response data if needed

        print('Request cacelled');
        print('Response: ${response.body}');
        Utils.snakbar(title: "Request cancelled", body: "Request cancelled");
        EasyLoading.dismiss();
        return true;
      } else {
        // Request failed
        EasyLoading.dismiss();
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (e) {
      // An error occurred
      EasyLoading.dismiss();

      print('Error making POST request: $e');
      return false;
    }
  }

  //get all mentor connnection
  Future<GetMentorConnections> getMentorsconnections() async {
    try {
      // Make the POST request
      final response = await http.get(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/mentor/${getMentorInfoFromJson(StorageServices.to.getString(getMentorInformationsss)).id}"));

      if (response.statusCode == 200) {
        // Request successful, handle response data if needed
        var data = jsonDecode(response.body);

        return GetMentorConnections.fromJson(data);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //get all mentee connnection
  Future<GetMenteeConnections> getMenteeConnections() async {
    try {
      // Make the POST request
      final response = await http.get(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/mentee/${getMentorInfoFromJson(StorageServices.to.getString(getMentorInformationsss)).id}"));

      if (response.statusCode == 200) {
        // Request successful, handle response data if needed
        var data = jsonDecode(response.body);

        return GetMenteeConnections.fromJson(data);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
