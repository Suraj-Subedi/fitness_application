import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/models/exercises.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Exercises>? exercises;
  Rx<List<Exercise>>? favouritesExercises;
  ProfileController profileController = Get.put(ProfileController());
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getExercises();
    if (exercises != null && profileController.user != null) {
      favouritesExercises = Rx<List<Exercise>>([]);
      for (var element in exercises!.value.data!) {
        if (profileController.user!.value.data!.favourites!
            .contains(element.id)) {
          favouritesExercises!.value.add(element);
        }
      }
    } else {
      print('exercises is null');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getExercises() async {
    try {
      var res = await services.getExercises();

      if (res is Exercises) {
        exercises = res.obs;
      } else if (res is ApiResponse && !res.isSucces) {
        exercises = Exercises().obs;
      } else {
        exercises = null;
      }
      update(['exercises']);
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}
