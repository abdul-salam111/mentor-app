// To parse this JSON data, do
//
//     final signinModel = signinModelFromJson(jsonString);

import 'dart:convert';

SigninModel signinModelFromJson(String str) => SigninModel.fromJson(json.decode(str));

String signinModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
    final String? password;
    final String? usernameOrEmail;

    SigninModel({
        this.password,
        this.usernameOrEmail,
    });

    factory SigninModel.fromJson(Map<String, dynamic> json) => SigninModel(
        password: json["password"],
        usernameOrEmail: json["usernameOrEmail"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
        "usernameOrEmail": usernameOrEmail,
    };
}
