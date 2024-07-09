import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class ConnectionsRepository {
  Future<bool> sendConnectionRequest(recId, recName) async {
    try {
      EasyLoading.show(status: "Sending...");
      // Make the POST request
      final response = await http.post(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connection-request/create?receiverId=$recId&senderId=${StorageServices.to.getString(userId)}"));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 201) {
        
        // Request successful, handle response data if needed
        var data = jsonDecode(response.body);
        // Request successful, handle response data if needed
        StorageServices.to
            .setString(key: 'cancelrequestId', value: data['id'].toString());
        Utils.snakbar(
            title: "Request Sent",
            body: "Request sent to $recName succefully!");
        EasyLoading.dismiss();
        return true;
      } else {
        // Request failed
        EasyLoading.dismiss();

        return false;
      }
    } catch (e) {
      // An error occurred
      EasyLoading.dismiss();
      return false;
    }
  }

  Future<bool> acceptConnectionRequest(recId) async {
    try {
      final response = await http.post(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/create?menteeId=$recId&mentorId=${StorageServices.to.getString(userId)}"));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        getMentorRecievedConnectionRequest();
        Utils.snakbar(title: "Accepted", body: "Connection Accepted");
        EasyLoading.dismiss();
        return true;
      } else {
        // Request failed
        EasyLoading.dismiss();

        return false;
      }
    } catch (e) {
      // An error occurred
      EasyLoading.dismiss();
      return false;
    }
  }

  //getmentor connections accepted
  Future getMentorsAcceptedConnections() async {
    try {
      final response = await http.get(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/mentor/${StorageServices.to.getString(userId)}"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return data;
      } else {
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      // An error occurred
      EasyLoading.dismiss();
      throw Exception();
    }
  }

//get all mentee connnection
  Future getMenteesAcceptedConnections() async {
    try {
      // Make the POST request
      final response = await http.get(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/mentee/${StorageServices.to.getString(userId)}"));

      if (response.statusCode == 200) {
        // Request successful, handle response data if needed
        var data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get mentor recieved requests
  Future getMentorRecievedConnectionRequest() async {
    String url =
        'https://guided-by-culture-production.up.railway.app/api/connection-request/get/${StorageServices.to.getString(userId)}';

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Request successful, parse response
        var responseData = jsonDecode(response.body);

        return responseData;
      } else {
        print(response.body);
        // Request failed with non-200 status code
        throw Exception();
      }
    } catch (error) {
      // Request failed due to network issues or other errors
      throw Exception();
    }
  }

  //get mentee send requests to mentors
  Future getMenteeSendRequests() async {

    String url =
        'https://guided-by-culture-production.up.railway.app/api/connection-request/get-mentee-connections/${StorageServices.to.getString(userId)}';

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Request successful, parse response
        var responseData = jsonDecode(response.body);
        return responseData;
      } else {
        // Request failed with non-200 status code
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }

  //cancel mentee requests send to mentors
  Future<bool> cancelMenteeRequestSentToMentors(connectionId) async {
    try {
      // Make the POST request
      final response = await http.delete(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connection-request/cancel/$connectionId"));

      if (response.statusCode == 200) {
        getMentorRecievedConnectionRequest();
        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //delete mentee requests recieved to mentors and accepted for the mentorside
  Future<bool> deleteAcceptedRequestSentByMentee(connectionId) async {
    try {
      // Make the POST request
      final response = await http.delete(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/remove?connectionId=$connectionId"));

      if (response.statusCode == 200) {
        getMentorsAcceptedConnections();
        Utils.snakbar(title: "Removed", body: "Connection Removed");


        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

   //delete mentee requests send to mentors and accepted for the mentee side
  Future<bool> deletedAcceptedRequestByMentorsSendByMentee(connectionId) async {
    try {
      // Make the POST request
      final response = await http.delete(Uri.parse(
          "https://guided-by-culture-production.up.railway.app/api/connections/remove?connectionId=$connectionId"));

      if (response.statusCode == 200) {
     
  getMentorsAcceptedConnections();
        Utils.snakbar(title: "Removed", body: "Connection Removed");
        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
