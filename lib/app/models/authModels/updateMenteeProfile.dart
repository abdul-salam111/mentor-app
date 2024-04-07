// To parse this JSON data, do
//
//     final updateMenteeProfile = updateMenteeProfileFromJson(jsonString);

import 'dart:convert';

UpdateMenteeProfile updateMenteeProfileFromJson(String str) => UpdateMenteeProfile.fromJson(json.decode(str));

String updateMenteeProfileToJson(UpdateMenteeProfile data) => json.encode(data.toJson());

class UpdateMenteeProfile {
    final String? about;
    final String? education;
    final String? email;
    final String? gender;
    final String? industry;
    final String? mentorshipStyle;
    final String? sessionDuration;
    final String? timeZone;

    UpdateMenteeProfile({
        this.about,
        this.education,
        this.email,
        this.gender,
        this.industry,
        this.mentorshipStyle,
        this.sessionDuration,
        this.timeZone,
    });

    factory UpdateMenteeProfile.fromJson(Map<String, dynamic> json) => UpdateMenteeProfile(
        about: json["about"],
        education: json["education"],
        email: json["email"],
        gender: json["gender"],
        industry: json["industry"],
        mentorshipStyle: json["mentorshipStyle"],
        sessionDuration: json["sessionDuration"],
        timeZone: json["timeZone"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "education": education,
        "email": email,
        "gender": gender,
        "industry": industry,
        "mentorshipStyle": mentorshipStyle,
        "sessionDuration": sessionDuration,
        "timeZone": timeZone,
    };
}
