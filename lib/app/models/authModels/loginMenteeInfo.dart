// To parse this JSON data, do
//
//     final loginMenteeRequestModel = loginMenteeRequestModelFromJson(jsonString);

import 'dart:convert';

LoginMenteeRequestModel loginMenteeRequestModelFromJson(String str) => LoginMenteeRequestModel.fromJson(json.decode(str));

String loginMenteeRequestModelToJson(LoginMenteeRequestModel data) => json.encode(data.toJson());

class LoginMenteeRequestModel {
    final String? password;

    final String? usernameOrEmail;

    LoginMenteeRequestModel({
        this.password,

        this.usernameOrEmail,
    });

    factory LoginMenteeRequestModel.fromJson(Map<String, dynamic> json) => LoginMenteeRequestModel(
        password: json["password"],

        usernameOrEmail: json["usernameOrEmail"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "usernameOrEmail": usernameOrEmail,
    };
}
