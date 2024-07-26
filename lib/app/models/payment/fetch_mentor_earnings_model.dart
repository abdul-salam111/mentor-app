class FetchMentorEarningsModel {
  int id;
  int mentorId;
  double inEscrow;
  double available;
  double review;

  FetchMentorEarningsModel({
    required this.id,
    required this.mentorId,
    required this.inEscrow,
    required this.available,
    required this.review,
  });

  factory FetchMentorEarningsModel.fromJson(Map<String, dynamic> json) {
    return FetchMentorEarningsModel(
      id: json['id'],
      mentorId: json['mentorId'],
      inEscrow: json['inEscrow'],
      available: json['available'],
      review: json['review'],
    );
  }
}

class FailedFetchMentorEarningsModel {
  // Any fields you want to include for the failure case
  String message;

  FailedFetchMentorEarningsModel({this.message = "No records found"});
}
