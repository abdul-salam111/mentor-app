// To parse this JSON data, do
//
//     final createMeetingWithMentee = createMeetingWithMenteeFromJson(jsonString);

import 'dart:convert';

CreateMeetingWithMentee createMeetingWithMenteeFromJson(String str) => CreateMeetingWithMentee.fromJson(json.decode(str));

String createMeetingWithMenteeToJson(CreateMeetingWithMentee data) => json.encode(data.toJson());

class CreateMeetingWithMentee {
    final String appointmentReason;
    final String appointmentStatus;
    final String date;
    final String day;
    final Time endTime;
    final int menteeId;
    final int mentorId;
    final Time startTime;

    CreateMeetingWithMentee({
        required this.appointmentReason,
        required this.appointmentStatus,
        required this.date,
        required this.day,
        required this.endTime,
        required this.menteeId,
        required this.mentorId,
        required this.startTime,
    });

    factory CreateMeetingWithMentee.fromJson(Map<String, dynamic> json) => CreateMeetingWithMentee(
        appointmentReason: json["appointmentReason"],
        appointmentStatus: json["appointmentStatus"],
        date: json["date"],
        day: json["day"],
        endTime: Time.fromJson(json["endTime"]),
        menteeId: json["menteeId"],
        mentorId: json["mentorId"],
        startTime: Time.fromJson(json["startTime"]),
    );

    Map<String, dynamic> toJson() => {
        "appointmentReason": appointmentReason,
        "appointmentStatus": appointmentStatus,
        "date": date,
        "day": day,
        "endTime": endTime.toJson(),
        "menteeId": menteeId,
        "mentorId": mentorId,
        "startTime": startTime.toJson(),
    };
}

class Time {
    final String hour;
    final String minute;
    final int nano;
    final String second;

    Time({
        required this.hour,
        required this.minute,
        required this.nano,
        required this.second,
    });

    factory Time.fromJson(Map<String, dynamic> json) => Time(
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
