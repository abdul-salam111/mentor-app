// To parse this JSON data, do
//
//     final jobCreationResponseModel = jobCreationResponseModelFromJson(jsonString);

import 'dart:convert';

JobCreationResponseModel jobCreationResponseModelFromJson(String str) => JobCreationResponseModel.fromJson(json.decode(str));

String jobCreationResponseModelToJson(JobCreationResponseModel data) => json.encode(data.toJson());

class JobCreationResponseModel {
    final String? compensation;
    final String? description;
    final int? id;
    final String? industry;
    final String? jobType;
    final String? jobUrl;
    final String? location;
    final int? mentorId;
    final String? messageStatus;
    final DateTime? postDate;
    final PostTime? postTime;

    JobCreationResponseModel({
        this.compensation,
        this.description,
        this.id,
        this.industry,
        this.jobType,
        this.jobUrl,
        this.location,
        this.mentorId,
        this.messageStatus,
        this.postDate,
        this.postTime,
    });

    factory JobCreationResponseModel.fromJson(Map<String, dynamic> json) => JobCreationResponseModel(
        compensation: json["compensation"],
        description: json["description"],
        id: json["id"],
        industry: json["industry"],
        jobType: json["jobType"],
        jobUrl: json["jobUrl"],
        location: json["location"],
        mentorId: json["mentorId"],
        messageStatus: json["messageStatus"],
        postDate: json["postDate"] == null ? null : DateTime.parse(json["postDate"]),
        postTime: json["postTime"] == null ? null : PostTime.fromJson(json["postTime"]),
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
        "postDate": "${postDate!.year.toString().padLeft(4, '0')}-${postDate!.month.toString().padLeft(2, '0')}-${postDate!.day.toString().padLeft(2, '0')}",
        "postTime": postTime?.toJson(),
    };
}

class PostTime {
    final int? hour;
    final int? minute;
    final int? nano;
    final int? second;

    PostTime({
        this.hour,
        this.minute,
        this.nano,
        this.second,
    });

    factory PostTime.fromJson(Map<String, dynamic> json) => PostTime(
        hour: json["hour"],
        minute: json["minute"],
        nano: json["nano"],
        second: json["second"],
    );

    Map<String, dynamic> toJson() => {
        "hour": hour,
        "minute": minute,
        "nano": nano,
        "second": second,
    };
}
