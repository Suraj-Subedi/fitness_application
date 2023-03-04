// To parse this JSON data, do
//
//     final exercises = exercisesFromJson(jsonString);

import 'dart:convert';

Exercises exercisesFromJson(String str) => Exercises.fromJson(json.decode(str));

String exercisesToJson(Exercises data) => json.encode(data.toJson());

class Exercises {
  Exercises({
    this.data,
    this.message,
    this.success,
  });

  List<Exercise>? data;
  String? message;
  bool? success;

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
        data: json["data"] == null
            ? []
            : List<Exercise>.from(
                json["data"]!.map((x) => Exercise.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "success": success,
      };
}

class Exercise {
  Exercise({
    this.id,
    this.title,
    this.desc,
    this.timeToComplete,
    this.steps,
    this.img,
    this.calories,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? title;
  String? desc;
  int? timeToComplete;
  List<String>? steps;
  String? img;
  int? calories;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["_id"],
        title: json["title"],
        desc: json["desc"],
        timeToComplete: json["timeToComplete"],
        steps: json["steps"] == null
            ? []
            : List<String>.from(json["steps"]!.map((x) => x)),
        img: json["img"],
        calories: json["calories"],
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
        "title": title,
        "desc": desc,
        "timeToComplete": timeToComplete,
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x)),
        "img": img,
        "calories": calories,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
