// To parse this JSON data, do
//
//     final createMenteeRequestModel = createMenteeRequestModelFromJson(jsonString);

import 'dart:convert';

CreateMenteeRequestModel createMenteeRequestModelFromJson(String str) => CreateMenteeRequestModel.fromJson(json.decode(str));

String createMenteeRequestModelToJson(CreateMenteeRequestModel data) => json.encode(data.toJson());

class CreateMenteeRequestModel {
    final String? about;
    final String? availableDays;
    final String? communicationChannels;
    final String? education;
    final String? email;
    final String? fullName;
    final String? goals;
    final String? gender;
    final String? industry;
    final String? mentorshipStyle;
    final String? password;
    final String? profilePicUrl;
    final String? sessionDuration;
    final String? skills;
    final String? timeZone;

    CreateMenteeRequestModel({
        this.about,
        this.availableDays,
        this.communicationChannels,
        this.education,
        this.email,
        this.fullName,
        this.goals,
        this.gender,
        this.industry,
        this.mentorshipStyle,
        this.password,
        this.profilePicUrl,
        this.sessionDuration,
        this.skills,
        this.timeZone,
    });

    factory CreateMenteeRequestModel.fromJson(Map<String, dynamic> json) => CreateMenteeRequestModel(
    about: json["about"],
    availableDays: json["availableDays"],
    communicationChannels: json["communicationChannels"],
    education: json["education"],
    email: json["email"],
    fullName: json["fullName"],
    goals: json["goals"],
    gender: json["gender"],
    industry: json["industry"],
    mentorshipStyle: json["mentorshipStyle"],
    password: json["password"],
    profilePicUrl: json["profilePicUrl"],
    sessionDuration: json["sessionDuration"],
    skills: json["skills"],
    timeZone: json["timeZone"],
);


    Map<String, dynamic> toJson() => {
        "about": about,
        "availableDays": availableDays,
        "communicationChannels": communicationChannels,
        "education": education,
        "email": email,
        "fullName": fullName,
        "goals": goals,
        "gender": gender,
        "industry": industry,
        "mentorshipStyle": mentorshipStyle,
        "password": password,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": skills,
        "timeZone": timeZone,
    };
}
