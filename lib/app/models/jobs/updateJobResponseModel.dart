// To parse this JSON data, do
//
//     final updateJobResponseModel = updateJobResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateJobResponseModel updateJobResponseModelFromJson(String str) => UpdateJobResponseModel.fromJson(json.decode(str));

String updateJobResponseModelToJson(UpdateJobResponseModel data) => json.encode(data.toJson());

class UpdateJobResponseModel {
    final String? compensation;
    final String? description;
    final int? id;
    final String? industry;
    final String? jobType;
    final String? jobUrl;
    final String? location;
    final int? mentorId;
    final String? messageStatus;

    UpdateJobResponseModel({
        this.compensation,
        this.description,
        this.id,
        this.industry,
        this.jobType,
        this.jobUrl,
        this.location,
        this.mentorId,
        this.messageStatus,
    });

    factory UpdateJobResponseModel.fromJson(Map<String, dynamic> json) => UpdateJobResponseModel(
        compensation: json["compensation"],
        description: json["description"],
        id: json["id"],
        industry: json["industry"],
        jobType: json["jobType"],
        jobUrl: json["jobUrl"],
        location: json["location"],
        mentorId: json["mentorId"],
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "compensation": compensation,
        "description": description,
        "id": id,
        "industry": industry,
        "jobType": jobType,
        "jobUrl": jobUrl,
        "location": location,
        "mentorId": mentorId,
        "messageStatus": messageStatus,
    };
}
