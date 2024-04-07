// To parse this JSON data, do
//
//     final createMentorResponseModel = createMentorResponseModelFromJson(jsonString);

import 'dart:convert';

CreateMentorResponseModel createMentorResponseModelFromJson(String str) => CreateMentorResponseModel.fromJson(json.decode(str));

String createMentorResponseModelToJson(CreateMentorResponseModel data) => json.encode(data.toJson());

class CreateMentorResponseModel {
    final String? about;
    final String? availabilityStatus;
    final List<AvailableDay>? availableDays;
    final List<CommunicationChannel>? communicationChannels;
    final String? email;
    final String? fullName;
    final String? gender;
    final int? id;
    final String? industry;
    final String? isVerified;
    final String? mentorshipStyle;
    final String? messageStatus;
    final String? password;
    final String? professionalBackgroundDescription;
    final String? profilePicUrl;
    final String? sessionDuration;
    final List<Skill>? skills;
    final String? timeZone;
    final int? yearsOfExperience;

    CreateMentorResponseModel({
        this.about,
        this.availabilityStatus,
        this.availableDays,
        this.communicationChannels,
        this.email,
        this.fullName,
        this.gender,
        this.id,
        this.industry,
        this.isVerified,
        this.mentorshipStyle,
        this.messageStatus,
        this.password,
        this.professionalBackgroundDescription,
        this.profilePicUrl,
        this.sessionDuration,
        this.skills,
        this.timeZone,
        this.yearsOfExperience,
    });

    factory CreateMentorResponseModel.fromJson(Map<String, dynamic> json) => CreateMentorResponseModel(
        about: json["about"],
        availabilityStatus: json["availabilityStatus"],
        availableDays: json["availableDays"] == null ? [] : List<AvailableDay>.from(json["availableDays"]!.map((x) => AvailableDay.fromJson(x))),
        communicationChannels: json["communicationChannels"] == null ? [] : List<CommunicationChannel>.from(json["communicationChannels"]!.map((x) => CommunicationChannel.fromJson(x))),
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
        skills: json["skills"] == null ? [] : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        timeZone: json["timeZone"],
        yearsOfExperience: json["yearsOfExperience"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
        "availabilityStatus": availabilityStatus,
        "availableDays": availableDays == null ? [] : List<dynamic>.from(availableDays!.map((x) => x.toJson())),
        "communicationChannels": communicationChannels == null ? [] : List<dynamic>.from(communicationChannels!.map((x) => x.toJson())),
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
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "timeZone": timeZone,
        "yearsOfExperience": yearsOfExperience,
    };
}

class AvailableDay {
    final String? day;
    final int? id;
    final int? mentorId;

    AvailableDay({
        this.day,
        this.id,
        this.mentorId,
    });

    factory AvailableDay.fromJson(Map<String, dynamic> json) => AvailableDay(
        day: json["day"],
        id: json["id"],
        mentorId: json["mentorId"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "id": id,
        "mentorId": mentorId,
    };
}

class CommunicationChannel {
    final String? channel;
    final int? id;
    final int? mentorId;

    CommunicationChannel({
        this.channel,
        this.id,
        this.mentorId,
    });

    factory CommunicationChannel.fromJson(Map<String, dynamic> json) => CommunicationChannel(
        channel: json["channel"],
        id: json["id"],
        mentorId: json["mentorId"],
    );

    Map<String, dynamic> toJson() => {
        "channel": channel,
        "id": id,
        "mentorId": mentorId,
    };
}

class Skill {
    final int? id;
    final int? mentorId;
    final String? skill;

    Skill({
        this.id,
        this.mentorId,
        this.skill,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        mentorId: json["mentorId"],
        skill: json["skill"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mentorId": mentorId,
        "skill": skill,
    };
}
