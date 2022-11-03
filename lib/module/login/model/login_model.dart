// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModel welcomeFromJson(String str) => LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.userName,
    this.issued,
    this.expires,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userName;
  String? issued;
  String? expires;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        userName: json["userName"],
        issued: json[".issued"],
        expires: json[".expires"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "userName": userName,
        ".issued": issued,
        ".expires": expires,
      };
}
