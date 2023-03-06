// To parse this JSON data, do
//
//     final stats = statsFromJson(jsonString);

import 'dart:convert';

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));

String statsToJson(Stats data) => json.encode(data.toJson());

class Stats {
  Stats({
    this.data,
    this.message,
    this.success,
  });

  List<Datum>? data;
  String? message;
  bool? success;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.id,
    this.totalCaloriesBurned,
    this.totalExerciseLogs,
  });

  dynamic id;
  int? totalCaloriesBurned;
  int? totalExerciseLogs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        totalCaloriesBurned: json["totalCaloriesBurned"],
        totalExerciseLogs: json["totalExerciseLogs"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "totalCaloriesBurned": totalCaloriesBurned,
        "totalExerciseLogs": totalExerciseLogs,
      };
}
