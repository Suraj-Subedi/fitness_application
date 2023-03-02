// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.data,
    this.message,
    this.success,
  });

  Data? data;
  String? message;
  bool? success;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "success": success,
      };
}

class Data {
  Data({
    this.id,
    this.email,
    this.fullName,
    this.birthDate,
    this.weight,
    this.favourites,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? email;
  String? fullName;
  DateTime? birthDate;
  int? weight;
  List<dynamic>? favourites;
  bool? isAdmin;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        email: json["email"],
        fullName: json["fullName"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        weight: json["weight"],
        favourites: json["favourites"] == null
            ? []
            : List<dynamic>.from(json["favourites"]!.map((x) => x)),
        isAdmin: json["isAdmin"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "fullName": fullName,
        "birthDate": birthDate?.toIso8601String(),
        "weight": weight,
        "favourites": favourites == null
            ? []
            : List<dynamic>.from(favourites!.map((x) => x)),
        "isAdmin": isAdmin,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
