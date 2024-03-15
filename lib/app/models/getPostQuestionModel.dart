// To parse this JSON data, do
//
//     final getPostQuestionModel = getPostQuestionModelFromJson(jsonString);

import 'dart:convert';

GetPostQuestionModel getPostQuestionModelFromJson(String str) => GetPostQuestionModel.fromJson(json.decode(str));

String getPostQuestionModelToJson(GetPostQuestionModel data) => json.encode(data.toJson());

class GetPostQuestionModel {
    final int? id;
    final int? menteeId;
    final String? question;
    final int? remainingQuestions;
    final String? industries;
    final DateTime? postDate;
    final String? messageStatus;

    GetPostQuestionModel({
        this.id,
        this.menteeId,
        this.question,
        this.remainingQuestions,
        this.industries,
        this.postDate,
        this.messageStatus,
    });

    factory GetPostQuestionModel.fromJson(Map<String, dynamic> json) => GetPostQuestionModel(
        id: json["id"],
        menteeId: json["menteeId"],
        question: json["question"],
        remainingQuestions: json["remainingQuestions"],
        industries: json["industries"],
        postDate: json["postDate"] == null ? null : DateTime.parse(json["postDate"]),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menteeId": menteeId,
        "question": question,
        "remainingQuestions": remainingQuestions,
        "industries": industries,
        "postDate": "${postDate!.year.toString().padLeft(4, '0')}-${postDate!.month.toString().padLeft(2, '0')}-${postDate!.day.toString().padLeft(2, '0')}",
        "messageStatus": messageStatus,
    };
}
