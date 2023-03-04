import 'package:fitness_app/app/components/exercise_card.dart';
import 'package:fitness_app/app/components/search_box.dart';
import 'package:fitness_app/app/components/stat_tile.dart';
import 'package:fitness_app/app/modules/main/controllers/main_controller.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var mainController = Get.find<MainController>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Hello ${controller.profileController.user?.value.data?.fullName}'),
                      Text(
                        'Lets Workout',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      mainController.persistentTabController.jumpToTab(3);
                    },
                    child: GetBuilder<ProfileController>(
                      id: 'profile',
                      builder: (controller) {
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5.w,
                          backgroundImage: NetworkImage(
                            getAvatar(
                                name: controller.user?.value.data?.fullName ??
                                    ''),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              const SearchBox(
                ishome: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Previous week results',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 45.w,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: StatTile(
                        index: index,
                        data: '12',
                        title: 'Exercises',
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Top Workouts',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GetBuilder<HomeController>(
                  id: 'exercises',
                  builder: (controller) {
                    if (controller.exercises == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (controller.exercises!.value.data!.isEmpty) {
                      return const Center(
                        child: Text('No Exercises Found'),
                      );
                    }
                    return SizedBox(
                      height: 92.h,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.exercises!.value.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: 5.w,
                            ),
                            child: ExerciseCard(
                              isFavorite: true,
                              exercise:
                                  controller.exercises!.value.data![index],
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
