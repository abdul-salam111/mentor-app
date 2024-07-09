import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/models/mentor/createMentorSchedularList.dart';
import 'package:mentor_app/app/routes/app_pages.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'dart:convert';

import 'package:mentor_app/app/storage/storage.dart';

//repostiory for availablity scheduling
//fetching mentors
//create schedule.
class AvailabilityScheduling {
  Future fetchMentorAvailbleSchedules() async {
    final response = await http.get(Uri.parse(
        "https://guided-by-culture-production.up.railway.app/api/mentor-schedule/${StorageServices.to.getString(userId)}/all"));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      print(data);
        return data;
      } else {
        // Handle error
        throw Exception(
            'Failed to load mentor schedule: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception();
    }
  }

  //fetching available mentors for mentees

  Future<dynamic> fetchMentorAvailbleSchedulesforMentees(mentorId) async {
    final response = await http.get(Uri.parse(
        "https://guided-by-culture-production.up.railway.app/api/mentor-schedule/$mentorId/all"));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return data;
      } else {
        // Handle error
        throw Exception(
            'Failed to load mentor schedule: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }


//create schedule for mentors to have meeting with mentee
  Future<void> createSchedule(String jsonAvailablity) async {
    // URL and JSON data
    String url =
        "https://guided-by-culture-production.up.railway.app/api/mentor-schedule/add";

    // Convert data to JSON
    List<Map<String, dynamic>> dataList =
        jsonDecode(jsonAvailablity).cast<Map<String, dynamic>>();

    try {
      EasyLoading.show(status: "Creating Schedule...");
      // Make POST request
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json', // Set content type here
          },
          body: jsonEncode(
            {"scheduleList": dataList},
          ));
      print(response.statusCode);
      print(response.body);
      // Check status code
      if (response.statusCode == 200) {
        print("POST request successful");
        print("Response: ${response.body}");
        Get.toNamed(Routes.NAVIGATION_BAR);
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        print("POST request failed with status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Error making POST request: $e");
    }
  }

//update scheduler
  Future<void> updateMentorScheduler(
    CreateMentorSchedularModel createMentorSchedularModel,
    String day,
  ) async {
    // URL and JSON data
    String url =
        "https://guided-by-culture-production.up.railway.app/api/mentor-schedule/${StorageServices.to.getString(userId)}/update/$day";

    // Convert data to JSON
    String jsonBody = json.encode(createMentorSchedularModel);

    try {
      // Make POST request
      http.Response response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;',
        },
        body: jsonBody,
      );

      // Check status code
      if (response.statusCode == 200) {
        print("POST request successful");
        print("Response: ${response.body}");
      } else {
        print("POST request failed with status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Error making POST request: $e");
    }
  }

//get MentorAvailbleSchedules by day
  Future getMentorAvailbleSchedulesByDay(day) async {
    final response = await http.get(Uri.parse(
        "https://guided-by-culture-production.up.railway.app/api/mentor-schedule/${StorageServices.to.getString(userId)}/day/$day"));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return data;
      } else {
        // Handle error
        throw Exception(
            'Failed to load mentor schedule: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception();
    }
  }
}
