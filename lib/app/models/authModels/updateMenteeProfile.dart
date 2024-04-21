// To parse this JSON data, do
//
//     final updateMenteeProfile = updateMenteeProfileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateMenteeProfile updateMenteeProfileFromJson(String str) => UpdateMenteeProfile.fromJson(json.decode(str));

String updateMenteeProfileToJson(UpdateMenteeProfile data) => json.encode(data.toJson());

class UpdateMenteeProfile {
    final String about;
    final List<String> availableDays;
    final List<String> communicationChannels;
    final String education;
    final String email;
    final String fullName;
    final String gender;
    final List<String> goals;
    final String industry;
    final String mentorshipStyle;
    final String sessionDuration;
    final List<String> skills;
    final String timeZone;

    UpdateMenteeProfile({
        required this.about,
        required this.availableDays,
        required this.communicationChannels,
        required this.education,
        required this.email,
        required this.fullName,
        required this.gender,
        required this.goals,
        required this.industry,
        required this.mentorshipStyle,
        required this.sessionDuration,
        required this.skills,
        required this.timeZone,
    });

    factory UpdateMenteeProfile.fromJson(Map<String, dynamic> json) => UpdateMenteeProfile(
        about: json["about"],
        availableDays: List<String>.from(json["availableDays"].map((x) => x)),
        communicationChannels: List<String>.from(json["communicationChannels"].map((x) => x)),
        education: json["education"],
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        goals: List<String>.from(json["goals"].map((x) => x)),
        industry: json["industry"],
        mentorshipStyle: json["mentorshipStyle"],
        sessionDuration: json["sessionDuration"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        timeZone: json["timeZone"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availableDays": List<dynamic>.from(availableDays.map((x) => x)),
        "communicationChannels": List<dynamic>.from(communicationChannels.map((x) => x)),
        "education": education,
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "goals": List<dynamic>.from(goals.map((x) => x)),
        "industry": industry,
        "mentorshipStyle": mentorshipStyle,
        "sessionDuration": sessionDuration,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "timeZone": timeZone,
    };
}
