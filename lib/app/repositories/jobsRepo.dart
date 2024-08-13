import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mentor_app/app/Utils/Utils.dart';
import 'package:mentor_app/app/models/jobs/getJobById.dart';
import 'package:mentor_app/app/models/jobs/getJobByIndustry.dart';
import 'package:mentor_app/app/models/jobs/updateJobResponseModel.dart';
import 'package:mentor_app/app/storage/keys.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_app/app/storage/storage.dart';

class JobsRepository {
  Future<void> createJob({dynamic data}) async {
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/job/create";

    // Set headers
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
    };
    try {
      EasyLoading.show(status: "Uploading...");
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Utils.snakbar(title: "Uploaded", body: "Job uploaded successfully!");
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw Exception();
    }
  }

  //get jobs
  Future<GetJobById> getJobsById({required int jobId}) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://guided-by-culture-production.up.railway.app/api/job/getById?jobId=$jobId'),
          headers: {
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GetJobById.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }

//get jobs by Industry
  Future<GetJobByIndustry> getJobsByIndustry({required String industry}) async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://guided-by-culture-production.up.railway.app/api/job/getByIndustry?industry=$industry'),
          headers: {
            "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
          });

      print('::: res ${response.body}');
      print('::: res ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GetJobByIndustry.fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }

  //update job
  Future<UpdateJobResponseModel> updateJob(
      {dynamic body, required String jobId}) async {
    // Endpoint URL
    String url =
        "https://guided-by-culture-production.up.railway.app/api/job/$jobId/update";

    // Set headers
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
    };
    try {
      EasyLoading.show(status: "Uploading...");
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        EasyLoading.dismiss();
        return UpdateJobResponseModel.fromJson(data);
      } else {
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw Exception();
    }
  }

  //delete job
  Future<void> deleteJob({required String jobId}) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://guided-by-culture-production.up.railway.app/api/job/$jobId/delete'),
      );

      if (response.statusCode == 200) {
        Utils.snakbar(title: "Deleted!", body: "Job Deleted Successfully");
      } else {
        throw Exception('Failed to delete Job');
      }
    } catch (e) {
      Utils.snakbar(title: "Error", body: e.toString());
      throw Exception();
    }
  }
}

