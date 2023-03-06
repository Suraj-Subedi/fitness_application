import 'package:fitness_app/app/components/exercise_card.dart';
import 'package:fitness_app/app/modules/home/controllers/home_controller.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
          physics: const BouncingScrollPhysics(),
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
                child: GetBuilder<HomeController>(
                    id: 'favourites',
                    builder: (controller) {
                      if (controller.favouritesExercises == null) {
                        return SizedBox(
                            height: 70.h,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      }

                      if (controller.favouritesExercises!.value.isEmpty) {
                        return SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 50.h,
                                child: Lottie.asset(Assets.noFavLottie),
                              ),
                              Center(
                                child: Text('No Favourites Added',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            homeController.favouritesExercises?.value.length ??
                                1,
                        itemBuilder: (context, index) {
                          return homeController
                                      .favouritesExercises?.value.length ==
                                  null
                              ? SizedBox(
                                  height: 70.h,
                                  child: const Center(
                                      child: CircularProgressIndicator()))
                              : ExerciseCard(
                                  exercise: homeController
                                      .favouritesExercises!.value[index]);
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
