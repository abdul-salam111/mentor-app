// To parse this JSON data, do
//
//     final createMentorRequestModel = createMentorRequestModelFromJson(jsonString);

import 'dart:convert';

CreateMentorRequestModel createMentorRequestModelFromJson(String str) => CreateMentorRequestModel.fromJson(json.decode(str));

String createMentorRequestModelToJson(CreateMentorRequestModel data) => json.encode(data.toJson());

class CreateMentorRequestModel {
    final String? about;
    final String? availabilityStatus;
    final List<String>? availableDays;
    final List<String>? communicationChannels;
    final String? email;
    final String? fullName;
    final String? gender;
    final String? industry;
    final String? isVerified;
    final String? mentorshipStyle;
    final String? password;
    final String? professionalBackgroundDescription;
    final String? profilePicUrl;
    final String? sessionDuration;
    final List<String>? skills;
    final String? timeZone;
    final int? yearsOfExperience;

    CreateMentorRequestModel({
        this.about,
        this.availabilityStatus,
        this.availableDays,
        this.communicationChannels,
        this.email,
        this.fullName,
        this.gender,
        this.industry,
        this.isVerified,
        this.mentorshipStyle,
        this.password,
        this.professionalBackgroundDescription,
        this.profilePicUrl,
        this.sessionDuration,
        this.skills,
        this.timeZone,
        this.yearsOfExperience,
    });

    factory CreateMentorRequestModel.fromJson(Map<String, dynamic> json) => CreateMentorRequestModel(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        availableDays: json["availableDays"] == null ? [] : List<String>.from(json["availableDays"]!.map((x) => x)),
        communicationChannels: json["communicationChannels"] == null ? [] : List<String>.from(json["communicationChannels"]!.map((x) => x)),
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        industry: json["industry"],
        isVerified: json["isVerified"],
        mentorshipStyle: json["mentorshipStyle"],
        password: json["password"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
        timeZone: json["timeZone"],
        yearsOfExperience: json["yearsOfExperience"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "availableDays": availableDays == null ? [] : List<dynamic>.from(availableDays!.map((x) => x)),
        "communicationChannels": communicationChannels == null ? [] : List<dynamic>.from(communicationChannels!.map((x) => x)),
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "industry": industry,
        "isVerified": isVerified,
        "mentorshipStyle": mentorshipStyle,
        "password": password,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "timeZone": timeZone,
        "yearsOfExperience": yearsOfExperience,
    };
}
