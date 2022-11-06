// To parse this JSON data, do
//
//     final RouteModel = RouteModelFromJson(jsonString);

import 'dart:convert';

List<RouteModel> routeModelFromJson(List<dynamic> routes) =>
    List<RouteModel>.from(routes.map((x) => RouteModel.fromJson(x)));

String routeModelToJson(List<RouteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RouteModel {
  RouteModel({
    required this.id,
    required this.code,
    required this.visitDate,
    required this.visitType,
    required this.customer,
    required this.product,
    required this.tasks,
  });

  int id;
  String code;
  DateTime visitDate;
  VisitType visitType;
  Customer customer;
  Product product;
  List<Task> tasks;

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        id: json["Id"],
        code: json["Code"],
        visitDate: DateTime.parse(json["VisitDate"]),
        visitType: visitTypeValues.map[json["VisitType"]]!,
        customer: Customer.fromJson(json["Customer"]),
        product: Product.fromJson(json["Product"]),
        tasks: List<Task>.from(json["Tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Code": code,
        "VisitDate": visitDate.toIso8601String(),
        "VisitType": visitTypeValues.reverse[visitType],
        "Customer": customer.toJson(),
        "Product": product.toJson(),
        "Tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    required this.id,
    required this.address,
    required this.name,
    required this.gender,
    required this.externalSysId,
    required this.age,
  });

  int id;
  String? address;
  String name;
  int gender;
  dynamic externalSysId;
  int age;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["Id"],
        address: json["Address"],
        name: json["Name"],
        gender: json["Gender"],
        externalSysId: json["ExternalSysId"],
        age: json["Age"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Address": address,
        "Name": name,
        "Gender": gender,
        "ExternalSysId": externalSysId,
        "Age": age,
      };
}

class Product {
  Product({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.code,
  });

  int id;
  String arabicName;
  String englishName;
  String code;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["Id"],
        arabicName: json["ArabicName"],
        englishName: json["EnglishName"],
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ArabicName": arabicName,
        "EnglishName": englishName,
        "Code": code,
      };
}

class Task {
  Task({
    required this.index,
    required this.icon,
    required this.name,
    required this.description,
    required this.widget,
    required this.done,
    required this.dependOn,
  });

  int index;
  String? icon;
  Description name;
  Description description;
  String widget;
  bool done;
  int dependOn;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        index: json["Index"],
        icon: json["Icon"],
        name: descriptionValues.map[json["Name"]]!,
        description: descriptionValues.map[json["Description"]]!,
        widget: json["Widget"],
        done: json["Done"],
        dependOn: json["DependOn"],
      );

  Map<String, dynamic> toJson() => {
        "Index": index,
        "Icon": icon,
        "Name": descriptionValues.reverse[name],
        "Description": descriptionValues.reverse[description],
        "Widget": widget,
        "Done": done,
        "DependOn": dependOn,
      };
}

enum Description {
  START_VISIT,
  ADD_SPARE_PART,
  ADD_SERVICE,
  END_VISIT,
  RESCHEDULE,
  START_VISIT_TO_CONTINUE_MAINTENANCE
}

final descriptionValues = EnumValues({
  "Add Service": Description.ADD_SERVICE,
  "Add Spare Part": Description.ADD_SPARE_PART,
  "End Visit": Description.END_VISIT,
  "Reschedule": Description.RESCHEDULE,
  "Start Visit": Description.START_VISIT,
  "Start visit to continue maintenance":
      Description.START_VISIT_TO_CONTINUE_MAINTENANCE
});

enum VisitType { MAINTENANCE }

final visitTypeValues = EnumValues({"Maintenance": VisitType.MAINTENANCE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
