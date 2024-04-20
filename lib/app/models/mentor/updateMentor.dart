// To parse this JSON data, do
//
//     final updateMentorRequestMode = updateMentorRequestModeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateMentorRequestMode updateMentorRequestModeFromJson(String str) => UpdateMentorRequestMode.fromJson(json.decode(str));

String updateMentorRequestModeToJson(UpdateMentorRequestMode data) => json.encode(data.toJson());

class UpdateMentorRequestMode {
    final String about;
    final String availabilityStatus;
    final List<String> availableDays;
    final List<String> communicationChannels;
    final String email;
    final String fullName;
    final String gender;
    final String industry;
    final String isVerified;
    final String mentorshipStyle;
    final String professionalBackgroundDescription;
    final String profilePicUrl;
    final String sessionDuration;
    final List<String> skills;
    final String timeZone;
    final int yearsOfExperience;

    UpdateMentorRequestMode({
        required this.about,
        required this.availabilityStatus,
        required this.availableDays,
        required this.communicationChannels,
        required this.email,
        required this.fullName,
        required this.gender,
        required this.industry,
        required this.isVerified,
        required this.mentorshipStyle,
        required this.professionalBackgroundDescription,
        required this.profilePicUrl,
        required this.sessionDuration,
        required this.skills,
        required this.timeZone,
        required this.yearsOfExperience,
    });

    factory UpdateMentorRequestMode.fromJson(Map<String, dynamic> json) => UpdateMentorRequestMode(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        availableDays: List<String>.from(json["availableDays"].map((x) => x)),
        communicationChannels: List<String>.from(json["communicationChannels"].map((x) => x)),
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        industry: json["industry"],
        isVerified: json["isVerified"],
        mentorshipStyle: json["mentorshipStyle"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        timeZone: json["timeZone"],
        yearsOfExperience: json["yearsOfExperience"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "availableDays": List<dynamic>.from(availableDays.map((x) => x)),
        "communicationChannels": List<dynamic>.from(communicationChannels.map((x) => x)),
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "industry": industry,
        "isVerified": isVerified,
        "mentorshipStyle": mentorshipStyle,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "timeZone": timeZone,
        "yearsOfExperience": yearsOfExperience,
    };
}
