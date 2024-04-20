// To parse this JSON data, do
//
//     final getMentorConnections = getMentorConnectionsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMentorConnections getMentorConnectionsFromJson(String str) => GetMentorConnections.fromJson(json.decode(str));

String getMentorConnectionsToJson(GetMentorConnections data) => json.encode(data.toJson());

class GetMentorConnections {
    final dynamic menteeConnections;
    final List<MentorConnection> mentorConnections;

    GetMentorConnections({
        required this.menteeConnections,
        required this.mentorConnections,
    });

    factory GetMentorConnections.fromJson(Map<String, dynamic> json) => GetMentorConnections(
        menteeConnections: json["menteeConnections"],
        mentorConnections: List<MentorConnection>.from(json["mentorConnections"].map((x) => MentorConnection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menteeConnections": menteeConnections,
        "mentorConnections": List<dynamic>.from(mentorConnections.map((x) => x.toJson())),
    };
}

class MentorConnection {
    final int id;
    final dynamic fullName;
    final String email;
    final String password;
    final String isVerified;
    final String education;
    final String gender;
    final String mentorshipStyle;
    final String industry;
    final String about;
    final String profilePicUrl;
    final String timeZone;
    final String sessionDuration;
    final int questionCount;

    MentorConnection({
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
    });

    factory MentorConnection.fromJson(Map<String, dynamic> json) => MentorConnection(
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
    };
}
