// To parse this JSON data, do
//
//     final getMenteeInfo = getMenteeInfoFromJson(jsonString);

import 'dart:convert';

GetMenteeInfo getMenteeInfoFromJson(String str) => GetMenteeInfo.fromJson(json.decode(str));

String getMenteeInfoToJson(GetMenteeInfo data) => json.encode(data.toJson());

class GetMenteeInfo {
    final int? id;
    final String? email;
    final String? education;
    final String? gender;
    final String?fullName;
    final String? mentorshipStyle;
    final String? industry;
    final String? about;
    final String? profilePicUrl;
    final String? timeZone;
    final String? sessionDuration;
    final List<AvailableDay>? availableDays;
    final List<CommunicationChannel>? communicationChannels;
    final List<Goal>? goals;
    final List<Skill>? skills;
    final String? messageStatus;

    GetMenteeInfo({
        this.id,
        this.email,
        this.education,
        this.gender,
        this.mentorshipStyle,
        this.industry,
        this.about,
        this.profilePicUrl,
        this.timeZone,
        this.sessionDuration,
        this.availableDays,
        this.communicationChannels,
        this.goals,
        this.fullName,
        this.skills,
        this.messageStatus,
    });

    factory GetMenteeInfo.fromJson(Map<String, dynamic> json) => GetMenteeInfo(
        id: json["id"],
        email: json["email"],
        education: json["education"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        profilePicUrl: json["profilePicUrl"],
        timeZone: json["timeZone"],
        fullName: json['fullName'],
        sessionDuration: json["sessionDuration"],
        availableDays: json["availableDays"] == null ? [] : List<AvailableDay>.from(json["availableDays"]!.map((x) => AvailableDay.fromJson(x))),
        communicationChannels: json["communicationChannels"] == null ? [] : List<CommunicationChannel>.from(json["communicationChannels"]!.map((x) => CommunicationChannel.fromJson(x))),
        goals: json["goals"] == null ? [] : List<Goal>.from(json["goals"]!.map((x) => Goal.fromJson(x))),
        skills: json["skills"] == null ? [] : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "education": education,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "profilePicUrl": profilePicUrl,
        "timeZone": timeZone,
        "fullName":fullName,
        "sessionDuration": sessionDuration,
        "availableDays": availableDays == null ? [] : List<dynamic>.from(availableDays!.map((x) => x.toJson())),
        "communicationChannels": communicationChannels == null ? [] : List<dynamic>.from(communicationChannels!.map((x) => x.toJson())),
        "goals": goals == null ? [] : List<dynamic>.from(goals!.map((x) => x.toJson())),
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toJson())),
        "messageStatus": messageStatus,
    };
}

class AvailableDay {
    final int? id;
    final int? menteeId;
    final String? day;

    AvailableDay({
        this.id,
        this.menteeId,
        this.day,
    });

    factory AvailableDay.fromJson(Map<String, dynamic> json) => AvailableDay(
        id: json["id"],
        menteeId: json["menteeId"],
        day: json["day"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menteeId": menteeId,
        "day": day,
    };
}

class CommunicationChannel {
    final int? id;
    final int? menteeId;
    final String? channel;

    CommunicationChannel({
        this.id,
        this.menteeId,
        this.channel,
    });

    factory CommunicationChannel.fromJson(Map<String, dynamic> json) => CommunicationChannel(
        id: json["id"],
        menteeId: json["menteeId"],
        channel: json["channel"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menteeId": menteeId,
        "channel": channel,
    };
}

class Goal {
    final int? id;
    final int? menteeId;
    final String? goal;

    Goal({
        this.id,
        this.menteeId,
        this.goal,
    });

    factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json["id"],
        menteeId: json["menteeId"],
        goal: json["goal"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menteeId": menteeId,
        "goal": goal,
    };
}

class Skill {
    final int? id;
    final int? menteeId;
    final String? skill;

    Skill({
        this.id,
        this.menteeId,
        this.skill,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        menteeId: json["menteeId"],
        skill: json["skill"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menteeId": menteeId,
        "skill": skill,
    };
}
