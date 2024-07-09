// To parse this JSON data, do
//
//     final createMentorRequestModel = createMentorRequestModelFromJson(jsonString);

import 'dart:convert';

CreateMentorRequestModel createMentorRequestModelFromJson(String str) =>
    CreateMentorRequestModel.fromJson(json.decode(str));

String createMentorRequestModelToJson(CreateMentorRequestModel data) =>
    json.encode(data.toJson());

class CreateMentorRequestModel {
  final String? about;
  final String? availabilityStatus;
  final String? availableDays;
  final String? communicationChannels;
  final String? email;
  final String? fullName;
  final String? gender;
  final String? industry;
  final String? goals;
  final String? mentorshipStyle;
  final String? password;
  final String? profBackDescription;
  final String? profilePicUrl;
  final String? sessionDuration;
  final String? skills;
  final String? timeZone;
  final int? yearOfExperience;

  CreateMentorRequestModel({
    this.about,
    this.availabilityStatus,
    this.availableDays,
    this.goals,
    this.communicationChannels,
    this.email,
    this.fullName,
    this.gender,
    this.industry,
    this.mentorshipStyle,
    this.password,
    this.profBackDescription,
    this.profilePicUrl,
    this.sessionDuration,
    this.skills,
    this.timeZone,
    this.yearOfExperience,
  });

  factory CreateMentorRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateMentorRequestModel(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        availableDays: json['availableDays'],
        communicationChannels: json['communicationChannels'],
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        industry: json["industry"],
        goals: json['goals'],
        mentorshipStyle: json["mentorshipStyle"],
        password: json["password"],
        profBackDescription: json["profBackDescription"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        skills: json['skills'],
        timeZone: json["timeZone"],
        yearOfExperience: json["yearOfExperience"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "availableDays": availableDays,
        "communicationChannels": communicationChannels,
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "industry": industry,
        "goals": goals,
        "mentorshipStyle": mentorshipStyle,
        "password": password,
        "profBackDescription": profBackDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": skills,
        "timeZone": timeZone,
        "yearOfExperience": yearOfExperience,
      };
}
