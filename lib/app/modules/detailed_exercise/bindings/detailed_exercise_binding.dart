import 'package:get/get.dart';

import '../controllers/detailed_exercise_controller.dart';

class DetailedExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailedExerciseController>(
      () => DetailedExerciseController(),
    );
  }
}
