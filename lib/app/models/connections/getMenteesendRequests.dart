// To parse this JSON data, do
//
//     final getMenteeSendRequests = getMenteeSendRequestsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMenteeSendRequests getMenteeSendRequestsFromJson(String str) => GetMenteeSendRequests.fromJson(json.decode(str));

String getMenteeSendRequestsToJson(GetMenteeSendRequests data) => json.encode(data.toJson());

class GetMenteeSendRequests {
    final List<MenteeConnection> menteeConnections;
    final dynamic mentorConnections;

    GetMenteeSendRequests({
        required this.menteeConnections,
        required this.mentorConnections,
    });

    factory GetMenteeSendRequests.fromJson(Map<String, dynamic> json) => GetMenteeSendRequests(
        menteeConnections: List<MenteeConnection>.from(json["menteeConnections"].map((x) => MenteeConnection.fromJson(x))),
        mentorConnections: json["mentorConnections"],
    );

    Map<String, dynamic> toJson() => {
        "menteeConnections": List<dynamic>.from(menteeConnections.map((x) => x.toJson())),
        "mentorConnections": mentorConnections,
    };
}

class MenteeConnection {
    final int id;
    final String fullName;
    final String email;
    final String password;
    final String isVerified;
    final String gender;
    final String mentorshipStyle;
    final String industry;
    final String about;
    final String professionalBackgroundDescription;
    final String profilePicUrl;
    final int yearsOfExperience;
    final String availabilityStatus;
    final String timeZone;
    final String sessionDuration;

    MenteeConnection({
        required this.id,
        required this.fullName,
        required this.email,
        required this.password,
        required this.isVerified,
        required this.gender,
        required this.mentorshipStyle,
        required this.industry,
        required this.about,
        required this.professionalBackgroundDescription,
        required this.profilePicUrl,
        required this.yearsOfExperience,
        required this.availabilityStatus,
        required this.timeZone,
        required this.sessionDuration,
    });

    factory MenteeConnection.fromJson(Map<String, dynamic> json) => MenteeConnection(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        isVerified: json["isVerified"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        profilePicUrl: json["profilePicUrl"],
        yearsOfExperience: json["yearsOfExperience"],
        availabilityStatus: json["availabilityStatus"],
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "isVerified": isVerified,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "yearsOfExperience": yearsOfExperience,
        "availabilityStatus": availabilityStatus,
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
    };
}
