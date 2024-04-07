// To parse this JSON data, do
//
//     final createMenteeRequestModel = createMenteeRequestModelFromJson(jsonString);

import 'dart:convert';

CreateMenteeRequestModel createMenteeRequestModelFromJson(String str) => CreateMenteeRequestModel.fromJson(json.decode(str));

String createMenteeRequestModelToJson(CreateMenteeRequestModel data) => json.encode(data.toJson());

class CreateMenteeRequestModel {
    final String? about;
    final List<String>? availableDays;
    final List<String>? communicationChannels;
    final String? education;
    final String? email;
    final String? fullName;
    final List<String>? goals;
    final String? gender;
    final String? industry;
    final String? mentorshipStyle;
    final String? password;
    final String? profilePicUrl;
    final String? sessionDuration;
    final List<String>? skills;
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
    availableDays: json["availableDays"] == null ? [] : List<String>.from(json["availableDays"].map((x) => x.toString())),
    communicationChannels: json["communicationChannels"] == null ? [] : List<String>.from(json["communicationChannels"].map((x) => x.toString())),
    education: json["education"],
    email: json["email"],
    fullName: json["fullName"],
    goals: json["goals"] == null ? [] : List<String>.from(json["goals"].map((x) => x.toString())),
    gender: json["gender"],
    industry: json["industry"],
    mentorshipStyle: json["mentorshipStyle"],
    password: json["password"],
    profilePicUrl: json["profilePicUrl"],
    sessionDuration: json["sessionDuration"],
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"].map((x) => x.toString())),
    timeZone: json["timeZone"],
);


    Map<String, dynamic> toJson() => {
        "about": about,
        "availableDays": availableDays == null ? [] : List<dynamic>.from(availableDays!.map((x) => x)),
        "communicationChannels": communicationChannels == null ? [] : List<dynamic>.from(communicationChannels!.map((x) => x)),
        "education": education,
        "email": email,
        "fullName": fullName,
        "goals": goals == null ? [] : List<dynamic>.from(goals!.map((x) => x)),
        "gender": gender,
        "industry": industry,
        "mentorshipStyle": mentorshipStyle,
        "password": password,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "timeZone": timeZone,
    };
}
