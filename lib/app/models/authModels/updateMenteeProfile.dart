// To parse this JSON data, do
//
//     final updateMenteeProfile = updateMenteeProfileFromJson(jsonString);

import 'dart:convert';

UpdateMenteeProfile updateMenteeProfileFromJson(String str) => UpdateMenteeProfile.fromJson(json.decode(str));

String updateMenteeProfileToJson(UpdateMenteeProfile data) => json.encode(data.toJson());

class UpdateMenteeProfile {
    final String about;
    final String availableDays;
    final String communicationChannels;


    final String fullName;
    final String gender;
    final String goals;
    final String?profilePicUrl;
    final String industry;
    final String mentorshipStyle;
    final String sessionDuration;
    final String skills;
    final int menteeId;
    final String timeZone;

    UpdateMenteeProfile({
        required this.about,
        required this.availableDays,
        required this.communicationChannels,


        required this.fullName,
        required this.gender,
        required this.goals,
        required this.menteeId,
        required this.profilePicUrl,
        required this.industry,
        required this.mentorshipStyle,
        required this.sessionDuration,
        required this.skills,
        required this.timeZone,
    });

    factory UpdateMenteeProfile.fromJson(Map<String, dynamic> json) => UpdateMenteeProfile(
        about: json["about"],
        availableDays: json['availableDays'],
        communicationChannels:json['communicationChannels'],


        fullName: json["fullName"],
        menteeId:json['menteeId'],
        gender: json["gender"],
        profilePicUrl:json['profilePicUrl'],
        goals:json['goals'],
        industry: json["industry"],
        mentorshipStyle: json["mentorshipStyle"],
        sessionDuration: json["sessionDuration"],
        skills: json['skills'],
        timeZone: json["timeZone"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availableDays":availableDays ,
        "communicationChannels": communicationChannels,
        

        "fullName": fullName,
        "gender": gender,
        "goals": goals,
        "menteeId":menteeId,
        "profilePicUrl":profilePicUrl,
        "industry": industry,
        "mentorshipStyle": mentorshipStyle,
        "sessionDuration": sessionDuration,
        "skills": skills,
        "timeZone": timeZone,
    };
}
