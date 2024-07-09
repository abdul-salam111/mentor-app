// To parse this JSON data, do
//
//     final createMentorSchedularModel = createMentorSchedularModelFromJson(jsonString);

import 'dart:convert';

CreateMentorSchedularModel createMentorSchedularModelFromJson(String str) =>
    CreateMentorSchedularModel.fromJson(json.decode(str));

String createMentorSchedularModelToJson(CreateMentorSchedularModel data) =>
    json.encode(data.toJson());

class CreateMentorSchedularModel {
  final List<ScheduleList> scheduleList;

  CreateMentorSchedularModel({
    required this.scheduleList,
  });

  factory CreateMentorSchedularModel.fromJson(Map<String, dynamic> json) =>
      CreateMentorSchedularModel(
        scheduleList: List<ScheduleList>.from(
            json["scheduleList"].map((x) => ScheduleList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scheduleList": List<dynamic>.from(scheduleList.map((x) => x.toJson())),
      };
}

class ScheduleList {
  final String day;
  final String endTime;
  final int mentorId;
  final int id;
  final String startTime;

  ScheduleList({
    required this.day,
    required this.endTime,
    required this.id,
    required this.mentorId,
    required this.startTime,
  });

  factory ScheduleList.fromJson(Map<String, dynamic> json) => ScheduleList(
        day: json["day"],
        endTime: json["endTime"],
        id: json['id'],
        mentorId: json["mentorId"],
        startTime: json["startTime"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "endTime": endTime,
        'id': id,
        "mentorId": mentorId,
        "startTime": startTime,
      };
}
