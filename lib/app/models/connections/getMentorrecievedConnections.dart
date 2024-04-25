// To parse this JSON data, do
//
//     final getMentorRecievedConnectionsRequestModel = getMentorRecievedConnectionsRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetMentorRecievedConnectionsRequestModel getMentorRecievedConnectionsRequestModelFromJson(String str) => GetMentorRecievedConnectionsRequestModel.fromJson(json.decode(str));

String getMentorRecievedConnectionsRequestModelToJson(GetMentorRecievedConnectionsRequestModel data) => json.encode(data.toJson());

class GetMentorRecievedConnectionsRequestModel {
    final List<ConnectionRequest> connectionRequests;
    final String messageStatus;

    GetMentorRecievedConnectionsRequestModel({
        required this.connectionRequests,
        required this.messageStatus,
    });

    factory GetMentorRecievedConnectionsRequestModel.fromJson(Map<String, dynamic> json) => GetMentorRecievedConnectionsRequestModel(
        connectionRequests: List<ConnectionRequest>.from(json["connectionRequests"].map((x) => ConnectionRequest.fromJson(x))),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "connectionRequests": List<dynamic>.from(connectionRequests.map((x) => x.toJson())),
        "messageStatus": messageStatus,
    };
}

class ConnectionRequest {
    final dynamic id;
    final dynamic mentorId;
    final Mentee mentee;
    final DateTime connectionRequestDate;
    final String connectionRequestTime;

    ConnectionRequest({
        required this.id,
        required this.mentorId,
        required this.mentee,
        required this.connectionRequestDate,
        required this.connectionRequestTime,
    });

    factory ConnectionRequest.fromJson(Map<String, dynamic> json) => ConnectionRequest(
        id: json["id"],
        mentorId: json["mentorId"],
        mentee: Mentee.fromJson(json["mentee"]),
        connectionRequestDate: DateTime.parse(json["connectionRequestDate"]),
        connectionRequestTime: json["connectionRequestTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mentorId": mentorId,
        "mentee": mentee.toJson(),
        "connectionRequestDate": "${connectionRequestDate.year.toString().padLeft(4, '0')}-${connectionRequestDate.month.toString().padLeft(2, '0')}-${connectionRequestDate.day.toString().padLeft(2, '0')}",
        "connectionRequestTime": connectionRequestTime,
    };
}

class Mentee {
    final int id;
    final String fullName;
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

    Mentee({
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

    factory Mentee.fromJson(Map<String, dynamic> json) => Mentee(
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
