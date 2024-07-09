// To parse this JSON data, do
//
//     final createNewJobModel = createNewJobModelFromJson(jsonString);

import 'dart:convert';

CreateNewJobModel createNewJobModelFromJson(String str) => CreateNewJobModel.fromJson(json.decode(str));

String createNewJobModelToJson(CreateNewJobModel data) => json.encode(data.toJson());

class CreateNewJobModel {
    final String compensation;
    final String description;
    final String industry;
    final String jobType;
    final String jobUrl;
    final String location;
    final int mentorId;

    CreateNewJobModel({
        required this.compensation,
        required this.description,
        required this.industry,
        required this.jobType,
        required this.jobUrl,
        required this.location,
        required this.mentorId,
    });

    factory CreateNewJobModel.fromJson(Map<String, dynamic> json) => CreateNewJobModel(
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
