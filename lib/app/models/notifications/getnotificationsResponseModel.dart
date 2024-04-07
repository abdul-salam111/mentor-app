// To parse this JSON data, do
//
//     final getNotificationResponseModel = getNotificationResponseModelFromJson(jsonString);

import 'dart:convert';

GetNotificationResponseModel getNotificationResponseModelFromJson(String str) => GetNotificationResponseModel.fromJson(json.decode(str));

String getNotificationResponseModelToJson(GetNotificationResponseModel data) => json.encode(data.toJson());

class GetNotificationResponseModel {
    final List<Notification>? notifications;
    final String? messageStatus;

    GetNotificationResponseModel({
        this.notifications,
        this.messageStatus,
    });

    factory GetNotificationResponseModel.fromJson(Map<String, dynamic> json) => GetNotificationResponseModel(
        notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"]!.map((x) => Notification.fromJson(x))),
        messageStatus: json["messageStatus"],
    );

    Map<String, dynamic> toJson() => {
        "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
        "messageStatus": messageStatus,
    };
}

class Notification {
    final int? id;
    final String? recipientEmail;
    final String? message;
    final String? timestamp;
    final DateTime? date;
    final bool? sent;

    Notification({
        this.id,
        this.recipientEmail,
        this.message,
        this.timestamp,
        this.date,
        this.sent,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        recipientEmail: json["recipientEmail"],
        message: json["message"],
        timestamp: json["timestamp"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        sent: json["sent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recipientEmail": recipientEmail,
        "message": message,
        "timestamp": timestamp,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "sent": sent,
    };
}
