// To parse this JSON data, do
//
//     final updateJobPostModel = updateJobPostModelFromJson(jsonString);

import 'dart:convert';

UpdateJobPostModel updateJobPostModelFromJson(String str) => UpdateJobPostModel.fromJson(json.decode(str));

String updateJobPostModelToJson(UpdateJobPostModel data) => json.encode(data.toJson());

class UpdateJobPostModel {
    final String? compensation;
    final String? description;
    final String? industry;
    final String? jobType;
    final String? jobUrl;
    final String? location;

    UpdateJobPostModel({
        this.compensation,
        this.description,
        this.industry,
        this.jobType,
        this.jobUrl,
        this.location,
    });

    factory UpdateJobPostModel.fromJson(Map<String, dynamic> json) => UpdateJobPostModel(
        compensation: json["compensation"],
        description: json["description"],
        industry: json["industry"],
        jobType: json["jobType"],
        jobUrl: json["jobUrl"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "compensation": compensation,
        "description": description,
        "industry": industry,
        "jobType": jobType,
        "jobUrl": jobUrl,
        "location": location,
    };
}
