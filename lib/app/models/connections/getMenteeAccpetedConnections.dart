// To parse this JSON data, do
//
//     final getMenteeAcceptedConnection = getMenteeAcceptedConnectionFromJson(jsonString);

import 'dart:convert';

GetMenteeAcceptedConnection getMenteeAcceptedConnectionFromJson(String str) => GetMenteeAcceptedConnection.fromJson(json.decode(str));

String getMenteeAcceptedConnectionToJson(GetMenteeAcceptedConnection data) => json.encode(data.toJson());

class GetMenteeAcceptedConnection {
    final List<MentConnection> menteeConnections;
    final List<MentConnection> mentorConnections;

    GetMenteeAcceptedConnection({
        required this.menteeConnections,
        required this.mentorConnections,
    });

    factory GetMenteeAcceptedConnection.fromJson(Map<String, dynamic> json) => GetMenteeAcceptedConnection(
        menteeConnections: List<MentConnection>.from(json["menteeConnections"].map((x) => MentConnection.fromJson(x))),
        mentorConnections: List<MentConnection>.from(json["mentorConnections"].map((x) => MentConnection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menteeConnections": List<dynamic>.from(menteeConnections.map((x) => x.toJson())),
        "mentorConnections": List<dynamic>.from(mentorConnections.map((x) => x.toJson())),
    };
}

class MentConnection {
    final String about;
    final String availabilityStatus;
    final String email;
    final String fullName;
    final String gender;
    final int id;
    final String industry;
    final String isVerified;
    final String mentorshipStyle;
    final String password;
    final String professionalBackgroundDescription;
    final String profilePicUrl;
    final String sessionDuration;
    final String timeZone;
    final int yearsOfExperience;
    final String education;
    final int questionCount;

    MentConnection({
        required this.about,
        required this.availabilityStatus,
        required this.email,
        required this.fullName,
        required this.gender,
        required this.id,
        required this.industry,
        required this.isVerified,
        required this.mentorshipStyle,
        required this.password,
        required this.professionalBackgroundDescription,
        required this.profilePicUrl,
        required this.sessionDuration,
        required this.timeZone,
        required this.yearsOfExperience,
        required this.education,
        required this.questionCount,
    });

    factory MentConnection.fromJson(Map<String, dynamic> json) => MentConnection(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        id: json["id"],
        industry: json["industry"],
        isVerified: json["isVerified"],
        mentorshipStyle: json["mentorshipStyle"],
        password: json["password"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        timeZone: json["timeZone"],
        yearsOfExperience: json["yearsOfExperience"],
        education: json["education"],
        questionCount: json["questionCount"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "id": id,
        "industry": industry,
        "isVerified": isVerified,
        "mentorshipStyle": mentorshipStyle,
        "password": password,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "timeZone": timeZone,
        "yearsOfExperience": yearsOfExperience,
        "education": education,
        "questionCount": questionCount,
    };
}
