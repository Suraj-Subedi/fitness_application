import 'dart:async';

import 'package:fitness_app/app/modules/detailed_exercise/views/detailed_exercise_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedExerciseController extends GetxController {
  //TODO: Implement DetailedExerciseController

  Rx<bool> isExerciseStarted = false.obs;
  Rx<Timer>? timer;
  Rx<int> time = 0.obs;

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

  void onExerciseCompleted() {
    isExerciseStarted.value = false;
    timer?.value.cancel();
    Get.close(1);
  }

  void onExerciseCancelled() {
    isExerciseStarted.value = false;
    timer?.value.cancel();
    Get.close(0);
  }

  void onExerciseStarted(int minutes) {
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
            child: const CountDownDialog(),
          );
        });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
