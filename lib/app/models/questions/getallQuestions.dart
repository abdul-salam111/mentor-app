// To parse this JSON data, do
//
//     final getQuestionModel = getQuestionModelFromJson(jsonString);

import 'dart:convert';

GetQuestionModel getQuestionModelFromJson(String str) => GetQuestionModel.fromJson(json.decode(str));

String getQuestionModelToJson(GetQuestionModel data) => json.encode(data.toJson());

class GetQuestionModel {
    final List<MenteeQuestion>? menteeQuestion;
    final String? messageStatus;

    GetQuestionModel({
        this.menteeQuestion,
        this.messageStatus,
    });

    factory GetQuestionModel.fromJson(Map<String, dynamic> json) => GetQuestionModel(
        menteeQuestion: json["menteeQuestion"] == null ? [] : List<MenteeQuestion>.from(json["menteeQuestion"]!.map((x) => MenteeQuestion.fromJson(x))),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "menteeQuestion": menteeQuestion == null ? [] : List<dynamic>.from(menteeQuestion!.map((x) => x.toJson())),
        "messageStatus": messageStatus,
    };
}

class MenteeQuestion {
    final int? id;
    final Mentee? mentee;
    final String? question;
    final DateTime? date;
    final String? time;

    MenteeQuestion({
        this.id,
        this.mentee,
        this.question,
        this.date,
        this.time,
    });

    factory MenteeQuestion.fromJson(Map<String, dynamic> json) => MenteeQuestion(
        id: json["id"],
        mentee: json["mentee"] == null ? null : Mentee.fromJson(json["mentee"]),
        question: json["question"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mentee": mentee?.toJson(),
        "question": question,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
    };
}

class Mentee {
    final int? id;
    final String? fullName;
    final String? email;
    final String? password;
    final String? isVerified;
    final String? education;
    final String? gender;
    final String? mentorshipStyle;
    final String? industry;
    final String? about;
    final String? profilePicUrl;
    final String? timeZone;
    final String? sessionDuration;
    final int? questionCount;

    Mentee({
        this.id,
        this.fullName,
        this.email,
        this.password,
        this.isVerified,
        this.education,
        this.gender,
        this.mentorshipStyle,
        this.industry,
        this.about,
        this.profilePicUrl,
        this.timeZone,
        this.sessionDuration,
        this.questionCount,
    });

    factory Mentee.fromJson(Map<String, dynamic> json) => Mentee(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        isVerified: json["isVerified"],
        education: json["education"],
        gender: json["gender"],
        mentorshipStyle: json["mentorshipStyle"],
        industry: json["industry"],
        about: json["about"],
        profilePicUrl: json["profilePicUrl"],
        timeZone: json["timeZone"],
        sessionDuration: json["sessionDuration"],
        questionCount: json["questionCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "isVerified": isVerified,
        "education": education,
        "gender": gender,
        "mentorshipStyle": mentorshipStyle,
        "industry": industry,
        "about": about,
        "profilePicUrl": profilePicUrl,
        "timeZone": timeZone,
        "sessionDuration": sessionDuration,
        "questionCount": questionCount,
    };
}
