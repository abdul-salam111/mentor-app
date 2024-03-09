// To parse this JSON data, do
//
//     final createMentee = createMenteeFromJson(jsonString);

import 'dart:convert';

CreateMentee createMenteeFromJson(String str) => CreateMentee.fromJson(json.decode(str));

String createMenteeToJson(CreateMentee data) => json.encode(data.toJson());

class CreateMentee {
    final String? about;
    final List<String>? availableDays;
    final List<String>? communicationChannels;
    final String? education;
    final String? email;
    final String? gender;
    final List<String>? goals;
    final int? id;
    final String? industry;
    final String? mentorshipStyle;
    final String? messageStatus;
    final String? profilePicUrl;
    final String? sessionDuration;
    final List<String>? skills;
    final String? timeZone;

    CreateMentee({
        this.about,
        this.availableDays,
        this.communicationChannels,
        this.education,
        this.email,
        this.gender,
        this.goals,
        this.id,
        this.industry,
        this.mentorshipStyle,
        this.messageStatus,
        this.profilePicUrl,
        this.sessionDuration,
        this.skills,
        this.timeZone,
    });

    factory CreateMentee.fromJson(Map<String, dynamic> json) => CreateMentee(
        about: json["about"],
        availableDays: json["availableDays"] == null ? [] : List<String>.from(json["availableDays"]!.map((x) => x)),
        communicationChannels: json["communicationChannels"] == null ? [] : List<String>.from(json["communicationChannels"]!.map((x) => x)),
        education: json["education"],
        email: json["email"],
        gender: json["gender"],
        goals: json["goals"] == null ? [] : List<String>.from(json["goals"]!.map((x) => x)),
        id: json["id"],
        industry: json["industry"],
        mentorshipStyle: json["mentorshipStyle"],
        messageStatus: json["messageStatus"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
        timeZone: json["timeZone"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availableDays": availableDays == null ? [] : List<dynamic>.from(availableDays!.map((x) => x)),
        "communicationChannels": communicationChannels == null ? [] : List<dynamic>.from(communicationChannels!.map((x) => x)),
        "education": education,
        "email": email,
        "gender": gender,
        "goals": goals == null ? [] : List<dynamic>.from(goals!.map((x) => x)),
        "id": id,
        "industry": industry,
        "mentorshipStyle": mentorshipStyle,
        "messageStatus": messageStatus,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "timeZone": timeZone,
    };
}
