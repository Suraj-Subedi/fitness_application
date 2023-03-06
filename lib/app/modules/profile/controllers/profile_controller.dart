import 'package:fitness_app/app/components/search_box.dart';
import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/models/user.dart';
import 'package:fitness_app/app/routes/app_pages.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:fitness_app/app/utils/memory_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  Rx<User>? user;

  final count = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getUserData() async {
    try {
      var data = await services.getUserDetails();
      if (data is ApiResponse) {
      } else if (data is User) {
        user = data.obs;
        mapUserData();
        homeController.mapFavExercises();
        update(['profile']);
      }
    } catch (e) {
      print(e);
    }
  }

  void mapUserData() {
    if (user != null) {
      nameController.text = user?.value.data?.fullName ?? '';
      emailController.text = user?.value.data?.email ?? '';
      birthDateController.text =
          getFormattedDate(user?.value.data?.birthDate ?? DateTime.now())!;
      weightController.text = user!.value.data!.weight.toString();
    }
  }

  void onLogout() async {
    await MemoryManagement.logOut();
    Get.offAllNamed(Routes.MAIN);
  }
}
