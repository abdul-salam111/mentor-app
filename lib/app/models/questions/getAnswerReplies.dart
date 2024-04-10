import 'dart:convert';

List<GetAnswerReplies> getAnswerRepliesFromJson(String str) =>
    List<GetAnswerReplies>.from(json.decode(str).map((x) => GetAnswerReplies.fromJson(x)));

String getAnswerRepliesToJson(List<GetAnswerReplies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAnswerReplies {
  final int id;
  final MenteeQuestion menteeQuestion;
  final String answer;
  final String mentorFullName;
  final String mentorProfilePicUrl;
  final int mentorId;
  final DateTime postDate;
  final String postTime;
  final dynamic messageStatus;

  GetAnswerReplies({
    required this.id,
    required this.menteeQuestion,
    required this.answer,
    required this.mentorFullName,
    required this.mentorProfilePicUrl,
    required this.mentorId,
    required this.postDate,
    required this.postTime,
    required this.messageStatus,
  });

  factory GetAnswerReplies.fromJson(Map<String, dynamic> json) => GetAnswerReplies(
        id: json["id"],
        menteeQuestion: MenteeQuestion.fromJson(json["menteeQuestion"]),
        answer: json["answer"],
        mentorFullName: json["mentorFullName"],
        mentorProfilePicUrl: json["mentorProfilePicUrl"],
        mentorId: json["mentorId"],
        postDate: DateTime.parse(json["postDate"]),
        postTime: json["postTime"],
        messageStatus: json["messageStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menteeQuestion": menteeQuestion.toJson(),
        "answer": answer,
        "mentorFullName": mentorFullName,
        "mentorProfilePicUrl": mentorProfilePicUrl,
        "mentorId": mentorId,
        "postDate": "${postDate.year.toString().padLeft(4, '0')}-${postDate.month.toString().padLeft(2, '0')}-${postDate.day.toString().padLeft(2, '0')}",
        "postTime": postTime,
        "messageStatus": messageStatus,
      };
}

class MenteeQuestion {
  final int id;
  final int menteeId;
  final String question;
  final String industry;
  final DateTime postDate;
  final String time;

  MenteeQuestion({
    required this.id,
    required this.menteeId,
    required this.question,
    required this.industry,
    required this.postDate,
    required this.time,
  });

  factory MenteeQuestion.fromJson(Map<String, dynamic> json) => MenteeQuestion(
        id: json["id"],
        menteeId: json["menteeId"],
        question: json["question"],
        industry: json["industry"],
        postDate: DateTime.parse(json["postDate"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menteeId": menteeId,
        "question": question,
        "industry": industry,
        "postDate": "${postDate.year.toString().padLeft(4, '0')}-${postDate.month.toString().padLeft(2, '0')}-${postDate.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}
