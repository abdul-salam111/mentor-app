// To parse this JSON data, do
//
//     final createMenteeModel = createMenteeModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

CreateMenteeModel createMenteeModelFromJson(String str) =>
    CreateMenteeModel.fromJson(json.decode(str));

String createMenteeModelToJson(CreateMenteeModel data) =>
    json.encode(data.toJson());

class CreateMenteeModel {
  final String? email;
  final String? education;
  final String? gender;
  final String? mentorshipStyle;
  final String? industry;
  final String? about;

  final String? timeZone;
  final String? sessionDuration;
  final dynamic availableDays;
  final dynamic communicationChannels;
  final dynamic goals;
  final dynamic skills;
  final String? password;

  CreateMenteeModel({
    this.email,
    this.education,
    this.gender,
    this.mentorshipStyle,
    this.industry,
    this.about,
 
    this.timeZone,
    this.sessionDuration,
    this.availableDays,
    this.communicationChannels,
    this.goals,
    this.skills,
    this.password,
  });

  factory CreateMenteeModel.fromJson(Map<String, dynamic> json) =>
      CreateMenteeModel(
        email: json["email"],
        education: json["education"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
       
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
        availableDays: json["availableDays"],
        communicationChannels: json["communicationChannels"],
        goals: json["goals"],
        skills: json["skills"],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "education": education,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
      
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
        "availableDays": availableDays,
        "communicationChannels": communicationChannels,
        "goals": goals,
        "skills": skills,
        "password": password,
      };
}
