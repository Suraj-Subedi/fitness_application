import 'dart:async';

import 'package:fitness_app/app/components/search_box.dart';
import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/models/exercises.dart';
import 'package:fitness_app/app/modules/detailed_exercise/views/detailed_exercise_view.dart';
import 'package:fitness_app/app/modules/home/controllers/home_controller.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedExerciseController extends GetxController {
  //TODO: Implement DetailedExerciseController

  Rx<bool> isExerciseStarted = false.obs;
  Rx<Timer>? timer;
  Rx<int> time = 0.obs;
  Rx<bool> isLoading = false.obs;

  HomeController homeController = Get.put(HomeController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String get timerText {
    final minutes = (time / 60).floor().toString().padLeft(2, '0');
    final seconds = (time % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> onExerciseCompleted({required Exercise exercise}) async {
    try {
      isLoading.value = true;
      var res = await services.addEerciseLog(
          exerciseId: exercise.id!,
          timeToComplete: exercise.timeToComplete!,
          calories: exercise.calories!,
          title: exercise.title!);
      if (res is ApiResponse && res.isSucces) {
        showCustomSnackBar(message: res.message, milliseconds: 1000);
        isExerciseStarted.value = false;
        timer?.value.cancel();
        Get.close(1);
        await homeController.getStats();
      } else if (res is ApiResponse && !res.isSucces) {
        showCustomSnackBar(message: res.message, milliseconds: 1000);
      } else {
        showCustomSnackBar(message: 'Something went wrong', milliseconds: 1000);
      }
    } catch (e) {
      showCustomSnackBar(message: e.toString(), milliseconds: 1000);
    } finally {
      isLoading.value = false;
    }
  }

  void onExerciseCancelled() {
    isExerciseStarted.value = false;
    timer?.value.cancel();
    Get.close(0);
  }

  void onExerciseStarted(int minutes, Exercise exercise) {
    isExerciseStarted.value = true;
    time.value = (minutes * 60);
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      time.value--;
      update(['countdown']);
    }).obs;
    showDialog(
        barrierDismissible: false,
        context: Get.context!,
        barrierColor: Colors.black.withOpacity(
          0.8,
        ),
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: CountDownDialog(
              e: exercise,
            ),
          );
        });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
