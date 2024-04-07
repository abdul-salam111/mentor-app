// To parse this JSON data, do
//
//     final getMenteeInfo = getMenteeInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMenteeInfo getMenteeInfoFromJson(String str) => GetMenteeInfo.fromJson(json.decode(str));

String getMenteeInfoToJson(GetMenteeInfo data) => json.encode(data.toJson());

class GetMenteeInfo {
    final int id;
    final String email;
    final dynamic fullName;
    final String education;
    final String gender;
    final String mentorshipStyle;
    final String industry;
    final String about;
    final String profilePicUrl;
    final String timeZone;
    final String sessionDuration;
    final List<String> availableDays;
    final List<String> communicationChannels;
    final List<String> goals;
    final List<String> skills;
    final String messageStatus;

    GetMenteeInfo({
        required this.id,
        required this.email,
        required this.fullName,
        required this.education,
        required this.gender,
        required this.mentorshipStyle,
        required this.industry,
        required this.about,
        required this.profilePicUrl,
        required this.timeZone,
        required this.sessionDuration,
        required this.availableDays,
        required this.communicationChannels,
        required this.goals,
        required this.skills,
        required this.messageStatus,
    });

    factory GetMenteeInfo.fromJson(Map<String, dynamic> json) => GetMenteeInfo(
        id: json["id"],
        email: json["email"],
        fullName: json["fullName"],
        education: json["education"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        profilePicUrl: json["profilePicUrl"],
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
        availableDays: List<String>.from(json["availableDays"].map((x) => x)),
        communicationChannels: List<String>.from(json["communicationChannels"].map((x) => x)),
        goals: List<String>.from(json["goals"].map((x) => x)),
        skills: List<String>.from(json["skills"].map((x) => x)),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullName": fullName,
        "education": education,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "profilePicUrl": profilePicUrl,
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
        "availableDays": List<dynamic>.from(availableDays.map((x) => x)),
        "communicationChannels": List<dynamic>.from(communicationChannels.map((x) => x)),
        "goals": List<dynamic>.from(goals.map((x) => x)),
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "messageStatus": messageStatus,
    };
}
