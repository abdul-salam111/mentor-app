// To parse this JSON data, do
//
//     final getMenteesMeetings = getMenteesMeetingsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMenteesMeetings getMenteesMeetingsFromJson(String str) => GetMenteesMeetings.fromJson(json.decode(str));

String getMenteesMeetingsToJson(GetMenteesMeetings data) => json.encode(data.toJson());

class GetMenteesMeetings {
    final List<MeetingResponseList> meetingResponseList;
    final String messageStatus;

    GetMenteesMeetings({
        required this.meetingResponseList,
        required this.messageStatus,
    });

    factory GetMenteesMeetings.fromJson(Map<String, dynamic> json) => GetMenteesMeetings(
        meetingResponseList: List<MeetingResponseList>.from(json["meetingResponseList"].map((x) => MeetingResponseList.fromJson(x))),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "meetingResponseList": List<dynamic>.from(meetingResponseList.map((x) => x.toJson())),
        "messageStatus": messageStatus,
    };
}

class MeetingResponseList {
    final int id;
    final Ment mentor;
    final Ment mentee;
    final String date;
    final String day;
    final String startTime;
    final String endTime;
    final dynamic appointmentStatus;
    final String appointmentReason;

    MeetingResponseList({
        required this.id,
        required this.mentor,
        required this.mentee,
        required this.date,
        required this.day,
        required this.startTime,
        required this.endTime,
        required this.appointmentStatus,
        required this.appointmentReason,
    });

    factory MeetingResponseList.fromJson(Map<String, dynamic> json) => MeetingResponseList(
        id: json["id"],
        mentor: Ment.fromJson(json["mentor"]),
        mentee: Ment.fromJson(json["mentee"]),
        date: json["date"],
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        appointmentStatus: json["appointmentStatus"],
        appointmentReason: json["appointmentReason"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mentor": mentor.toJson(),
        "mentee": mentee.toJson(),
        "date": date,
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "appointmentStatus": appointmentStatus,
        "appointmentReason": appointmentReason,
    };
}

class Ment {
    final int id;
    final String fullName;
    final String email;
    final String password;
    final String isVerified;
    final dynamic education;
    final String gender;
    final String mentorshipStyle;
    final String industry;
    final String about;
    final String profilePicUrl;
    final String timeZone;
    final String sessionDuration;
    final int questionCount;
    final String professionalBackgroundDescription;
    final int yearsOfExperience;
    final String availabilityStatus;

    Ment({
        required this.id,
        required this.fullName,
        required this.email,
        required this.password,
        required this.isVerified,
        required this.education,
        required this.gender,
        required this.mentorshipStyle,
        required this.industry,
        required this.about,
        required this.profilePicUrl,
        required this.timeZone,
        required this.sessionDuration,
        required this.questionCount,
        required this.professionalBackgroundDescription,
        required this.yearsOfExperience,
        required this.availabilityStatus,
    });

    factory Ment.fromJson(Map<String, dynamic> json) => Ment(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        isVerified: json["isVerified"],
        education: json["education"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        profilePicUrl: json["profilePicUrl"],
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
        questionCount: json["questionCount"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        yearsOfExperience: json["yearsOfExperience"],
        availabilityStatus: json["availabilityStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "isVerified": isVerified,
        "education": education,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "profilePicUrl": profilePicUrl,
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
        "questionCount": questionCount,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "yearsOfExperience": yearsOfExperience,
        "availabilityStatus": availabilityStatus,
    };
}
