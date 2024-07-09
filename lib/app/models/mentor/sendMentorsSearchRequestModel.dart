// To parse this JSON data, do
//
//     final sendMentorsSearchRequestModel = sendMentorsSearchRequestModelFromJson(jsonString);

import 'dart:convert';

SendMentorsSearchRequestModel sendMentorsSearchRequestModelFromJson(String str) => SendMentorsSearchRequestModel.fromJson(json.decode(str));

String sendMentorsSearchRequestModelToJson(SendMentorsSearchRequestModel data) => json.encode(data.toJson());

class SendMentorsSearchRequestModel {
    final String availability;
    final String industry;
    final String searchPhrase;
    final List<String> skill;

    SendMentorsSearchRequestModel({
        required this.availability,
        required this.industry,
        required this.searchPhrase,
        required this.skill,
    });

    factory SendMentorsSearchRequestModel.fromJson(Map<String, dynamic> json) => SendMentorsSearchRequestModel(
        availability: json["availability"],
        industry: json["industry"],
        searchPhrase: json["searchPhrase"],
        skill: List<String>.from(json["skill"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "availability": availability,
        "industry": industry,
        "searchPhrase": searchPhrase,
        "skill": List<dynamic>.from(skill.map((x) => x)),
    };
}
