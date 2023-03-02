import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/models/user.dart';
import 'package:fitness_app/app/network/api_endpoints.dart';
import 'package:fitness_app/app/network/api_handler.dart';
import 'package:fitness_app/app/services/services.dart';
import 'package:fitness_app/app/utils/memory_management.dart';

class AppServices implements Services {
  @override
  Future getUserDetails() async {
    final res = await ApiHandler.hitApi(dio.get(APIs.getUserDetails));
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
      required String password}) async {}
}
