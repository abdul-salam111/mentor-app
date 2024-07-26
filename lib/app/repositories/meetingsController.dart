import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/modules/walletIntegeration/views/pay_to_book_slot_for_meeting.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:mentor_app/app/storage/storage.dart';

class MeetingRepository {
  Future createMeetingWithMentor(
      {required String mentorId,
      required String endTime,
      required String name, // for screen
      required String startTime,
      required String dateTime,
      required String appointreason,
      required String day}) async {
    // Define the URL
    String url =
        'https://guided-by-culture-production.up.railway.app/meetings/add';

    // Define the request body
    Map<String, dynamic> requestBody = {
      "appointmentReason": appointreason,
      "appointmentStatus": "string",
      "date": dateTime,
      "day": day,
      "endTime": endTime,
      "menteeId": StorageServices.to.getString(userId).toString(),
      "mentorId": mentorId.toString(),
      "startTime": startTime,
    };
    print(
        '::::MeetingRepository => createMeetingWithMentor req body ${requestBody}');
    // Encode the request body to JSON
    String jsonBody = json.encode(requestBody);
    // Make the POST request
    try {
      EasyLoading.show(status: "Creating Meeting");
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );
      print(
          '::: MeetingRepository => createMeetingWithMentor response.statusCode: ${response.statusCode} and response.body: ${response.body} ');

      // Check the response status code
      if (response.statusCode == 201) {
        print('Meeting added successfully');
        EasyLoading.dismiss();
        // Get.toNamed(Routes.NAVIGATION_BAR);
        // You can handle further logic here
        final jsonData = json.decode(response.body);
        var mentorId = jsonData['mentorId'];
        var id = jsonData['id'];
        var subTotal = formatMoney(jsonData['subTotal']);
        var totalHours = formatTotalHours(jsonData['totalHours']);
        Get.to(
          () => PayToBookSlotForMeeting(
            name: name,
            numOfMeetingHours: totalHours,
            mentorId: mentorId,
            menteeId: StorageServices.to.getString(userId).toString(),
            bookingId: id,
            inEscrowAmount: subTotal,
          ),
        );
      } else {
        print('Failed to add meeting. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        EasyLoading.dismiss();
      }
    } catch (e) {
      print('Exception occurred: $e');
      EasyLoading.dismiss();
    }
  }

 String formatTotalHours(double totalHours) {
  // Extract hours and minutes from the totalHours
  int hours = totalHours.floor();
  int minutes = ((totalHours - hours) * 60).round();
  
  // Construct the formatted time string
  String hourPart = hours > 0 ? '$hours hour${hours > 1 ? 's' : ''}' : '';
  String minutePart = minutes > 0 ? '$minutes minute${minutes > 1 ? 's' : ''}' : '';
  
  // Combine the parts, ensuring proper spacing
  if (hours > 0 && minutes > 0) {
    return '$hourPart and $minutePart';
  } else if (hours > 0) {
    return hourPart;
  } else if (minutes > 0) {
    return minutePart;
  } else {
    return '0 minutes';
  }
}


  String formatMoney(double amount) {
    // Round the amount to 2 decimal places
    String formattedAmount = amount.toStringAsFixed(2);

    // Format the amount with a currency symbol (e.g., $)
    return formattedAmount;
  }

  Future meetingCopletedWithMentorByMentee({
    required String mentorId,
    required menteeId,
    required String bookingId,
    required String name, // for screen
  }) async {
    // Define the URL
    String url =
        'https://guided-by-culture-production.up.railway.app/api/payment/meeting-completed';

    // Define the request body
    Map<String, dynamic> requestBody = {
      "mentorId": mentorId,
      "menteeId": menteeId,
      "bookingId": bookingId
    };
    print(':::: req body ${requestBody}');
    // Encode the request body to JSON
    String jsonBody = json.encode(requestBody);
    // Make the POST request
    try {
      EasyLoading.show(status: "Meeting marked as Completed");
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );
      print(
          '::: MeetingRepository => meetingCopletedWithMentorByMentee response.statusCode: ${response.statusCode} and response.body: ${response.body} ');

      // Check the response status code
      if (response.statusCode == 200) {
        Utils.snakbar(title: 'Success', body: 'Meeting marked completed');

        print('Meeting completed successfully');
        EasyLoading.dismiss();
        // You can handle further logic here
      } else {
        print(
            'Failed to complete meeting. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        EasyLoading.dismiss();
      }
    } catch (e) {
      print('Exception occurred: $e');
      EasyLoading.dismiss();
    }
  }

  //get mentees meetings
  Future fetchMenteesMeetings() async {
    print('::: mentee id ${StorageServices.to.getString(userId)}');
    final url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/meetings/mentee/${StorageServices.to.getString(userId)}');

    try {
      final response = await http.get(url);
      if (kDebugMode) {
        print(
            '::: MeetingRepository => fetchMenteesMeetings ${response.body} ');
      }
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  //cancel meeting by Mentee with mentors
  Future cancelMeetingByMentee(meetingId, name) async {
    final url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/meetings/delete/$meetingId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        Utils.snakbar(title: "Deleted", body: "Meeting deleted with $name");
        var data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

//Fetch mentors meetings
  Future fetchMentorsMeetings() async {
    final url = Uri.parse(
        'https://guided-by-culture-production.up.railway.app/meetings/mentor/${StorageServices.to.getString(userId)}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
