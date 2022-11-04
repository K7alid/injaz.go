// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
List<CardModel> CardModelFromJson(String str) =>
    List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

String CardModelToJson(List<CardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardModel {
  CardModel({
    required this.name,
    required this.count,
  });

  String name;
  int count;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        name: json["Name"],
        count: json["Count"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Count": count,
      };
}
