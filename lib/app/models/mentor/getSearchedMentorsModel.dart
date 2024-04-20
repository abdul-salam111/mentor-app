// To parse this JSON data, do
//
//     final getSearchedMentors = getSearchedMentorsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetSearchedMentors> getSearchedMentorsFromJson(String str) => List<GetSearchedMentors>.from(json.decode(str).map((x) => GetSearchedMentors.fromJson(x)));

String getSearchedMentorsToJson(List<GetSearchedMentors> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSearchedMentors {
    final String about;
    final String availabilityStatus;
    final List<String> availableDays;
    final List<String> communicationChannels;
    final String email;
    final String fullName;
    final String gender;
    final int id;
    final String industry;
    final String isVerified;
    final String mentorshipStyle;
    final String messageStatus;
    final String password;
    final String professionalBackgroundDescription;
    final String profilePicUrl;
    final String sessionDuration;
    final List<String> skills;
    final String timeZone;
    final int yearsOfExperience;

    GetSearchedMentors({
        required this.about,
        required this.availabilityStatus,
        required this.availableDays,
        required this.communicationChannels,
        required this.email,
        required this.fullName,
        required this.gender,
        required this.id,
        required this.industry,
        required this.isVerified,
        required this.mentorshipStyle,
        required this.messageStatus,
        required this.password,
        required this.professionalBackgroundDescription,
        required this.profilePicUrl,
        required this.sessionDuration,
        required this.skills,
        required this.timeZone,
        required this.yearsOfExperience,
    });

    factory GetSearchedMentors.fromJson(Map<String, dynamic> json) => GetSearchedMentors(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        availableDays: List<String>.from(json["availableDays"].map((x) => x)),
        communicationChannels: List<String>.from(json["communicationChannels"].map((x) => x)),
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        id: json["id"],
        industry: json["industry"],
        isVerified: json["isVerified"],
        mentorshipStyle: json["mentorshipStyle"],
        messageStatus: json["messageStatus"],
        password: json["password"],
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
        "id": id,
        "industry": industry,
        "isVerified": isVerified,
        "mentorshipStyle": mentorshipStyle,
        "messageStatus": messageStatus,
        "password": password,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "timeZone": timeZone,
        "yearsOfExperience": yearsOfExperience,
    };
}
