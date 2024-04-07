// To parse this JSON data, do
//
//     final jobCreationModel = jobCreationModelFromJson(jsonString);

import 'dart:convert';

JobCreationModel jobCreationModelFromJson(String str) => JobCreationModel.fromJson(json.decode(str));

String jobCreationModelToJson(JobCreationModel data) => json.encode(data.toJson());

class JobCreationModel {
    final String? compensation;
    final String? description;
    final String? industry;
    final String? jobType;
    final String? jobUrl;
    final String? location;
    final int? mentorId;

    JobCreationModel({
        this.compensation,
        this.description,
        this.industry,
        this.jobType,
        this.jobUrl,
        this.location,
        this.mentorId,
    });

    factory JobCreationModel.fromJson(Map<String, dynamic> json) => JobCreationModel(
        compensation: json["compensation"],
        description: json["description"],
        industry: json["industry"],
        jobType: json["jobType"],
        jobUrl: json["jobUrl"],
        location: json["location"],
        mentorId: json["mentorId"],
    );

    Map<String, dynamic> toJson() => {
        "compensation": compensation,
        "description": description,
        "industry": industry,
        "jobType": jobType,
        "jobUrl": jobUrl,
        "location": location,
        "mentorId": mentorId,
    };
}
