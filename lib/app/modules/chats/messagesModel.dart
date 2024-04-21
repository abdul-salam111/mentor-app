// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
    final String? recievedById;
    final String? recievedByName;

    final String? sendbyId;

    final String? lastMessage;
    final List<String>? userIds;
    final String? sendbyName;
    final String? createdAt;

    MessageModel({
        this.recievedById,
        this.recievedByName,

        this.sendbyId,

        this.lastMessage,
        this.userIds,
        this.sendbyName,
        this.createdAt,
    });

    factory MessageModel.fromJson(QueryDocumentSnapshot json) => MessageModel(
        recievedById: json["recievedById"],
        recievedByName: json["recievedByName"],

        sendbyId: json["sendbyId"],

        lastMessage: json["lastMessage"],
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        sendbyName: json["sendbyName"],
        createdAt: json["createdAt"],
    );

    Map<String, dynamic> toJson() => {
        "recievedById": recievedById,
        "recievedByName": recievedByName,

        "sendbyId": sendbyId,

        "lastMessage": lastMessage,
        "userIds": userIds == null ? [] : List<dynamic>.from(userIds!.map((x) => x)),
        "sendbyName": sendbyName,
        "createdAt": createdAt,
    };
}
