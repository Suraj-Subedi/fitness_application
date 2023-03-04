import 'package:dio/dio.dart';
import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/routes/app_pages.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Rx<bool> isLoading = false.obs;

  //TODO: Implement RegisterController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void validateRegisterForm() {
    if (nameController.text.isEmpty) {
      showCustomSnackBar(message: 'Name is required');
    } else if (emailController.text.isEmpty) {
      showCustomSnackBar(message: 'Email is required');
    } else if (!emailController.text.isEmail) {
      showCustomSnackBar(message: 'Invalid Email');
    } else if (birthdateController.text.isEmpty) {
      showCustomSnackBar(message: 'Birthdate is required');
    } else if (weightController.text.isEmpty) {
      showCustomSnackBar(message: 'Weight is required');
    } else if (passwordController.text.isEmpty) {
      showCustomSnackBar(message: 'Password is required');
    } else if (passwordController.text.length < 6) {
      showCustomSnackBar(
          message: 'Password must be at least 6 characters',
          milliseconds: 1000);
    } else {
      onRegister();
    }
  }

  void onRegister() async {
    try {
      isLoading.value = true;
      var res = await services.register(
          name: nameController.text,
          email: emailController.text,
          birthdate: birthdateController.text,
          weight: double.parse(weightController.text),
          password: passwordController.text);

      if (res is ApiResponse && res.isSucces) {
        Get.offAllNamed(Routes.LOGIN);
        showCustomSnackBar(message: res.message);
      } else if (res is ApiResponse && !res.isSucces) {
        showCustomSnackBar(message: res.message);
      } else {
        showCustomSnackBar(message: 'Something went wrong');
      }
    } on DioError catch (e) {
      showCustomSnackBar(
          message: e.response?.data['message'] ?? 'Something went wrong');
    } catch (e) {
      showCustomSnackBar(message: 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }

  void increment() => count.value++;
}
