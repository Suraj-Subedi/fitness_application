import 'package:fitness_app/app/components/exercise_card.dart';
import 'package:fitness_app/app/modules/home/controllers/home_controller.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());
    var homeController = Get.put(HomeController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'My Favourites',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 90.h,
                child: ListView.builder(
                  itemCount: homeController.favouritesExercises!.value.length,
                  itemBuilder: (context, index) {
                    return ExerciseCard(
                        exercise:
                            homeController.favouritesExercises!.value[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
