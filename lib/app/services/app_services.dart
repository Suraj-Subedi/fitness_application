import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/models/exercises.dart';
import 'package:fitness_app/app/models/stats.dart';
import 'package:fitness_app/app/models/user.dart';
import 'package:fitness_app/app/network/api_endpoints.dart';
import 'package:fitness_app/app/network/api_handler.dart';
import 'package:fitness_app/app/services/services.dart';
import 'package:fitness_app/app/utils/memory_management.dart';

class AppServices implements Services {
  @override
  Future getUserDetails() async {
    final res = await ApiHandler.hitApi(
        dio.get(APIs.getUserDetails + MemoryManagement.getUserId()!));
    if (res is Response && res.statusCode == 200) {
      return User.fromJson(res.data);
    } else {
      return ApiResponse(isSucces: false, message: 'Something went wrong');
    }
  }

  @override
  Future login({required String email, required String password}) async {
    final res = await ApiHandler.hitApi(dio.post(APIs.login, data: {
      "email": email,
      "password": password,
    }));

    var response = res.data['data'];

    if (res is Response && res.statusCode == 200) {
      if (response['isAdmin']) {
        return ApiResponse(isSucces: false, message: 'Login from Admin App');
      } else {
        MemoryManagement.setAccessToken(accessToken: response['accessToken']);
        MemoryManagement.setLoginStatus(status: true);
        return ApiResponse(isSucces: true, message: 'Login Successful');
      }
    } else {}
  }

  @override
  Future register(
      {required String email,
      required String name,
      required String birthdate,
      required double weight,
      required String password}) async {
    final res = await ApiHandler.hitApi(dio.post(APIs.register, data: {
      "email": email,
      "fullName": name,
      "birthDate": birthdate,
      "weight": weight,
      "password": password,
    }));

    if (res is Response && res.statusCode == 201) {
      return ApiResponse(
          isSucces: true, message: 'User registered successfully!');
    } else {
      return ApiResponse(isSucces: false, message: 'Something went wrong');
    }
  }

  @override
  Future getExercises() async {
    final res = await ApiHandler.hitApi(dio.get(APIs.exercises));
    if (res is Response && res.statusCode == 200) {
      return Exercises.fromJson(res.data);
    } else {
      return ApiResponse(isSucces: false, message: 'Something went wrong');
    }
  }

  @override
  Future updateUserDetails(
      {required String name,
      required String birthdate,
      required double weight}) async {
    final res = await ApiHandler.hitApi(
        dio.put(APIs.updateUserDetails + MemoryManagement.getUserId()!, data: {
      "fullName": name,
      "birthDate": birthdate,
      "weight": weight,
    }));

    if (res is Response && res.statusCode == 200) {
      return ApiResponse(isSucces: true, message: 'User updated Successfully');
    } else {
      return ApiResponse(
          isSucces: false,
          message: res.data['message'] ?? 'Something went wrong');
    }
  }

  @override
  Future addToFavourites({required String exerciseId}) async {
    var res = await ApiHandler.hitApi(
        dio.put(APIs.favourites + MemoryManagement.getUserId()!, data: {
      "exercise": exerciseId,
    }));

    if (res is Response && res.statusCode == 200) {
      return ApiResponse(isSucces: true, message: 'Added to favourites');
    } else {
      return ApiResponse(
          isSucces: false,
          message: res.data['message'] ?? 'Something went wrong');
    }
  }

  @override
  Future removeFromFavourites({required String exerciseId}) async {
    var res = await ApiHandler.hitApi(
        dio.delete(APIs.favourites + MemoryManagement.getUserId()!, data: {
      "exercise": exerciseId,
    }));

    if (res is Response && res.statusCode == 200) {
      return ApiResponse(isSucces: true, message: 'Removed from favourites');
    } else {
      return ApiResponse(
          isSucces: false,
          message: res.data['message'] ?? 'Something went wrong');
    }
  }

  @override
  Future addEerciseLog(
      {required String exerciseId,
      required int timeToComplete,
      required int calories,
      required String title}) async {
    final res = await ApiHandler.hitApi(
        dio.post(APIs.exerciseLog + MemoryManagement.getUserId()!, data: {
      "title": title,
      "exerciseId": exerciseId,
      "timeToComplete": timeToComplete,
      "calories": calories,
    }));

    if (res is Response && res.statusCode == 200) {
      return ApiResponse(
          isSucces: true, message: 'Exercise completed successfully');
    } else {
      return ApiResponse(
          isSucces: false,
          message: res.data['message'] ?? 'Something went wrong');
    }
  }

  @override
  Future getStatsById({required bool isThisWeek}) async {
    final res = await ApiHandler.hitApi(
      dio.get(APIs.stats + MemoryManagement.getUserId()!,
          queryParameters: {"range": isThisWeek ? "week" : "allTime"}),
    );
    if (res is Response && res.statusCode == 200) {
      return Stats.fromJson(res.data);
    } else {
      return ApiResponse(isSucces: false, message: 'Something went wrong');
    }
  }

  @override
  Future changePassword({
    required String oldPassword,
    required String newPassword,
    required String email,
  }) async {
    final res = await ApiHandler.hitApi(
        dio.post(APIs.changePassword + MemoryManagement.getUserId()!, data: {
      "email": email,
      "password": oldPassword,
      "newPassword": newPassword,
    }));

    if (res is Response && res.statusCode == 200) {
      return ApiResponse(
          isSucces: true, message: 'Password changed successfully');
    } else {
      return ApiResponse(
          isSucces: false,
          message: res.data['message'] ?? 'Something went wrong');
    }
  }
}
