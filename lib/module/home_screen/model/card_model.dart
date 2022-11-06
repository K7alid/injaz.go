import 'dart:convert';

List<CardModel> cardModelFromJson(List<dynamic> cards) =>
    List<CardModel>.from(cards.map((x) => CardModel.fromJson(x)));

String cardModelToJson(List<CardModel> data) =>
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
