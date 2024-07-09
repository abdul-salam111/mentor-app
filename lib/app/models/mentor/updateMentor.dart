// To parse this JSON data, do
//
//     final createMentorRequestModel = createMentorRequestModelFromJson(jsonString);

import 'dart:convert';

UpdateMentorRequestModel createMentorRequestModelFromJson(String str) =>
    UpdateMentorRequestModel.fromJson(json.decode(str));

String createMentorRequestModelToJson(UpdateMentorRequestModel data) =>
    json.encode(data.toJson());

class UpdateMentorRequestModel {
  final String? about;
  final String? availabilityStatus;
  final String? availableDays;
  final String? communicationChannels;

  final String? fullName;
  final String? gender;
  final String? industry;
  final String? goals;
  final String? mentorshipStyle;

  final String? profBackDescription;
  final String? profilePicUrl;
  final String? sessionDuration;
  final String? skills;
  final String? timeZone;
  final int? yearOfExperience;

  UpdateMentorRequestModel({
    this.about,
    this.availabilityStatus,
    this.availableDays,
    this.goals,
    this.communicationChannels,
    this.fullName,
    this.gender,
    this.industry,
    this.mentorshipStyle,
    this.profBackDescription,
    this.profilePicUrl,
    this.sessionDuration,
    this.skills,
    this.timeZone,
    this.yearOfExperience,
  });

  factory UpdateMentorRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateMentorRequestModel(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        availableDays: json["availableDays"],
        communicationChannels: json["communicationChannels"],
        fullName: json["fullName"],
        gender: json["gender"],
        industry: json["industry"],
        goals: json['goals'],
        mentorshipStyle: json["mentorshipStyle"],
        profBackDescription: json["profBackDescription"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        skills: json["skills"],
        timeZone: json["timeZone"],
        yearOfExperience: json["yearOfExperience"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "availableDays": availableDays,
        "communicationChannels": communicationChannels,
        "fullName": fullName,
        "gender": gender,
        "industry": industry,
        "goals": goals,
        "mentorshipStyle": mentorshipStyle,
        "profBackDescription": profBackDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": skills,
        "timeZone": timeZone,
        "yearOfExperience": yearOfExperience,
      };
}
