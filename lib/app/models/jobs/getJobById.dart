// To parse this JSON data, do
//
//     final getJobById = getJobByIdFromJson(jsonString);

import 'dart:convert';

GetJobById getJobByIdFromJson(String str) => GetJobById.fromJson(json.decode(str));

String getJobByIdToJson(GetJobById data) => json.encode(data.toJson());

class GetJobById {
    final String? compensation;
    final String? description;
    final int? id;
    final String? industry;
    final String? jobType;
    final String? jobUrl;
    final String? location;
    final Mentor? mentor;
    final String? postDate;
    final String? postTime;

    GetJobById({
        this.compensation,
        this.description,
        this.id,
        this.industry,
        this.jobType,
        this.jobUrl,
        this.location,
        this.mentor,
        this.postDate,
        this.postTime,
    });

    factory GetJobById.fromJson(Map<String, dynamic> json) => GetJobById(
        compensation: json["compensation"],
        description: json["description"],
        id: json["id"],
        industry: json["industry"],
        jobType: json["jobType"],
        jobUrl: json["jobUrl"],
        location: json["location"],
        mentor: json["mentor"] == null ? null : Mentor.fromJson(json["mentor"]),
        postDate: json["postDate"],
        postTime: json["postTime"],
    );

    Map<String, dynamic> toJson() => {
        "compensation": compensation,
        "description": description,
        "id": id,
        "industry": industry,
        "jobType": jobType,
        "jobUrl": jobUrl,
        "location": location,
        "mentor": mentor?.toJson(),
        "postDate": postDate,
        "postTime": postTime,
    };
}

class Mentor {
    final String? about;
    final String? availabilityStatus;
    final String? education;
    final String? email;
    final String? fullName;
    final String? gender;
    final int? id;
    final String? industry;
    final String? isVerified;
    final String? mentorshipStyle;
    final String? password;
    final String? professionalBackgroundDescription;
    final String? profilePicUrl;
    final String? sessionDuration;
    final String? timeZone;
    final int? yearsOfExperience;

    Mentor({
        this.about,
        this.availabilityStatus,
        this.education,
        this.email,
        this.fullName,
        this.gender,
        this.id,
        this.industry,
        this.isVerified,
        this.mentorshipStyle,
        this.password,
        this.professionalBackgroundDescription,
        this.profilePicUrl,
        this.sessionDuration,
        this.timeZone,
        this.yearsOfExperience,
    });

    factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        education: json["education"],
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        id: json["id"],
        industry: json["industry"],
        isVerified: json["isVerified"],
        mentorshipStyle: json["mentorshipStyle"],
        password: json["password"],
        professionalBackgroundDescription: json["professionalBackgroundDescription"],
        profilePicUrl: json["profilePicUrl"],
        sessionDuration: json["sessionDuration"],
        timeZone: json["timeZone"],
        yearsOfExperience: json["yearsOfExperience"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "education": education,
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "id": id,
        "industry": industry,
        "isVerified": isVerified,
        "mentorshipStyle": mentorshipStyle,
        "password": password,
        "professionalBackgroundDescription": professionalBackgroundDescription,
        "profilePicUrl": profilePicUrl,
        "sessionDuration": sessionDuration,
        "timeZone": timeZone,
        "yearsOfExperience": yearsOfExperience,
    };
}
