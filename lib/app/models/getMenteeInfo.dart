// To parse this JSON data, do
//
//     final getMenteeModel = getMenteeModelFromJson(jsonString);

import 'dart:convert';

GetMenteeModel getMenteeModelFromJson(String str) => GetMenteeModel.fromJson(json.decode(str));

String getMenteeModelToJson(GetMenteeModel data) => json.encode(data.toJson());

class GetMenteeModel {
    final int? id;
    final String? email;
    final String? education;
    final String? gender;
    final String? mentorshipStyle;
    final String? industry;
    final String? about;
    final String? profilePicUrl;
    final String? timeZone;
    final String? sessionDuration;
    final dynamic availableDays;
    final dynamic communicationChannels;
    final dynamic goals;
    final dynamic skills;
    final String? messageStatus;

    GetMenteeModel({
        this.id,
        this.email,
        this.education,
        this.gender,
        this.mentorshipStyle,
        this.industry,
        this.about,
        this.profilePicUrl,
        this.timeZone,
        this.sessionDuration,
        this.availableDays,
        this.communicationChannels,
        this.goals,
        this.skills,
        this.messageStatus,
    });

    factory GetMenteeModel.fromJson(Map<String, dynamic> json) => GetMenteeModel(
        id: json["id"],
        email: json["email"],
        education: json["education"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        profilePicUrl: json["profilePicUrl"],
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
        availableDays: json["availableDays"],
        communicationChannels: json["communicationChannels"],
        goals: json["goals"],
        skills: json["skills"],
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "education": education,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "profilePicUrl": profilePicUrl,
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
        "availableDays": availableDays,
        "communicationChannels": communicationChannels,
        "goals": goals,
        "skills": skills,
        "messageStatus": messageStatus,
    };
}
