class SubmitAnswer {
  final String answer;
  final int? menteeQuestionId; // Make it nullable
  final int? mentorId; // Make it nullable

  SubmitAnswer({
    required this.answer,
    this.menteeQuestionId, // Update type to nullable
    this.mentorId, // Update type to nullable
  });

  factory SubmitAnswer.fromJson(Map<String, dynamic> json) => SubmitAnswer(
        answer: json["answer"],
        menteeQuestionId: json["menteeQuestionId"], // It could be null, so no need for casting
        mentorId: json["mentorId"], // It could be null, so no need for casting
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "menteeQuestionId": menteeQuestionId,
        "mentorId": mentorId,
      };
}
