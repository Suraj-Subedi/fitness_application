import 'package:fitness_app/app/models/api_response.dart';
import 'package:fitness_app/app/models/exercises.dart';
import 'package:fitness_app/app/models/stats.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Exercises>? exercises;
  Rx<bool> isFavouriteLoading = false.obs;
  Rx<Stats>? thisWeek;
  Rx<Stats>? allTime;
  Rx<List<Exercise>>? favouritesExercises;
  ProfileController profileController = Get.put(ProfileController());
  final count = 0.obs;
  Rx<bool> selectThisWeek = true.obs;
  @override
  void onInit() async {
    super.onInit();
    await getExercises();
    await getStats();
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
        mapFavExercises();
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

  Future<void> addFavourite({required Exercise exercise}) async {
    try {
      isFavouriteLoading.value = true;
      var res = await services.addToFavourites(exerciseId: exercise.id!);
      if (res is ApiResponse && res.isSucces) {
        await profileController.getUserData();
        mapFavExercises();
        showCustomSnackBar(message: res.message, milliseconds: 1000);
      } else if (res is ApiResponse && !res.isSucces) {
        showCustomSnackBar(message: res.message, milliseconds: 1000);
      } else {
        showCustomSnackBar(message: 'Something went wrong', milliseconds: 1000);
      }
    } catch (e) {
    } finally {
      isFavouriteLoading.value = false;
    }
  }

  Future<void> removeFavourite({required Exercise exercise}) async {
    try {
      isFavouriteLoading.value = true;
      var res = await services.removeFromFavourites(exerciseId: exercise.id!);
      if (res is ApiResponse && res.isSucces) {
        await profileController.getUserData();
        mapFavExercises();
        showCustomSnackBar(message: res.message, milliseconds: 1000);
      } else if (res is ApiResponse && !res.isSucces) {
        showCustomSnackBar(message: res.message, milliseconds: 1000);
      } else {
        showCustomSnackBar(message: 'Something went wrong', milliseconds: 1000);
      }
    } catch (e) {
      print(e);
    } finally {
      isFavouriteLoading.value = false;
    }
  }

  void mapFavExercises() {
    if (exercises != null && profileController.user != null) {
      favouritesExercises = Rx<List<Exercise>>([]);
      for (var element in exercises!.value.data!) {
        if (profileController.user!.value.data!.favourites!
            .contains(element.id)) {
          favouritesExercises!.value.add(element);
        }
      }
    }
    update(['favourites']);
  }

  Future<void> getStats() async {
    try {
      var isThisWeek = selectThisWeek.value;
      var res = await services.getStatsById(isThisWeek: isThisWeek);

      if (res is Stats) {
        isThisWeek ? thisWeek = res.obs : allTime = res.obs;
      } else if (res is ApiResponse && !res.isSucces) {
        isThisWeek ? thisWeek = Stats().obs : allTime = Stats().obs;
      } else {
        isThisWeek ? thisWeek = null : allTime = null;
      }
    } catch (e) {
    } finally {
      update(['stats']);
    }
  }

  void increment() => count.value++;
}
