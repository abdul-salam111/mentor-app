// To parse this JSON data, do
//
//     final loginMenteeInfo = loginMenteeInfoFromJson(jsonString);

import 'dart:convert';

LoginMenteeInfo loginMenteeInfoFromJson(String str) => LoginMenteeInfo.fromJson(json.decode(str));

String loginMenteeInfoToJson(LoginMenteeInfo data) => json.encode(data.toJson());

class LoginMenteeInfo {
    final String? accessToken;
    final String? tokenType;

    LoginMenteeInfo({
        this.accessToken,
        this.tokenType,
    });

    factory LoginMenteeInfo.fromJson(Map<String, dynamic> json) => LoginMenteeInfo(
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "tokenType": tokenType,
    };
}
