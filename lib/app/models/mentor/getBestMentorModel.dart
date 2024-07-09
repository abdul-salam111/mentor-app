// To parse this JSON data, do
//
//     final getBestMentorModel = getBestMentorModelFromJson(jsonString);

import 'dart:convert';

GetBestMentorModel getBestMentorModelFromJson(String str) => GetBestMentorModel.fromJson(json.decode(str));

String getBestMentorModelToJson(GetBestMentorModel data) => json.encode(data.toJson());

class GetBestMentorModel {
    final int id;
    final String fullName;
    final String email;
    final String password;
    final String isVerified;
    final String gender;
    final String mentorshipStyle;
    final String industry;
    final String about;
    final String professionalBackgroundDescription;
    final String profilePicUrl;
    final int yearsOfExperience;
    final String availabilityStatus;
    final String timeZone;
    final String sessionDuration;
    final List<dynamic> availableDays;
    final List<dynamic> communicationChannels;
    final List<dynamic> skills;
    final String messageStatus;

    GetBestMentorModel({
        required this.id,
        required this.fullName,
        required this.email,
        required this.password,
        required this.isVerified,
        required this.gender,
        required this.mentorshipStyle,
        required this.industry,
        required this.about,
        required this.professionalBackgroundDescription,
        required this.profilePicUrl,
        required this.yearsOfExperience,
        required this.availabilityStatus,
        required this.timeZone,
        required this.sessionDuration,
        required this.availableDays,
        required this.communicationChannels,
        required this.skills,
        required this.messageStatus,
    });

    factory GetBestMentorModel.fromJson(Map<String, dynamic> json) => GetBestMentorModel(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        isVerified: json["isVerified"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        profilePicUrl: json["profilePicUrl"],
        yearsOfExperience: json["yearsOfExperience"],
        availabilityStatus: json["availabilityStatus"],
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
        availableDays: List<dynamic>.from(json["availableDays"].map((x) => x)),
        communicationChannels: List<dynamic>.from(json["communicationChannels"].map((x) => x)),
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "isVerified": isVerified,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "yearsOfExperience": yearsOfExperience,
        "availabilityStatus": availabilityStatus,
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
        "availableDays": List<dynamic>.from(availableDays.map((x) => x)),
        "communicationChannels": List<dynamic>.from(communicationChannels.map((x) => x)),
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "messageStatus": messageStatus,
    };
}
