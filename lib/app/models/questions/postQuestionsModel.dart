// To parse this JSON data, do
//
//     final postQuestionModel = postQuestionModelFromJson(jsonString);

import 'dart:convert';

PostQuestionModel postQuestionModelFromJson(String str) => PostQuestionModel.fromJson(json.decode(str));

String postQuestionModelToJson(PostQuestionModel data) => json.encode(data.toJson());

class PostQuestionModel {
    final String? industries;
    final int? menteeId;
    final String? question;

    PostQuestionModel({
        this.industries,
        this.menteeId,
        this.question,
    });

    factory PostQuestionModel.fromJson(Map<String, dynamic> json) => PostQuestionModel(
        industries: json["industries"],
        menteeId: json["menteeId"],
        question: json["question"],
    );

    Map<String, dynamic> toJson() => {
        "industries": industries,
        "menteeId": menteeId,
        "question": question,
    };
}
