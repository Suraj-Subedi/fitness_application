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
              GetBuilder<ProfileController>(
                  id: 'profile',
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Hello ${controller.user?.value.data?.fullName ?? "User"}'),
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
                                      name: controller
                                              .user?.value.data?.fullName ??
                                          ''),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: 2.h,
              ),
              const SearchBox(
                ishome: true,
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => DropdownButton(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(2.w),
                    value: controller.selectThisWeek.value,
                    items: [
                      DropdownMenuItem(
                        value: true,
                        child: Text(
                          'This week',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text(
                          'All time',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) async {
                      controller.selectThisWeek.value = value as bool;
                      await controller.getStats();
                      controller.update(['stats']);
                    }),
              ),
              GetBuilder<HomeController>(
                  id: 'stats',
                  builder: (controller) {
                    if (controller.selectThisWeek.value
                        ? controller.thisWeek == null
                        : controller.allTime == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      height: 45.w,
                      child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var current = controller.selectThisWeek.value
                              ? controller.thisWeek?.value.data?.first
                              : controller.allTime?.value.data?.first;
                          var listData = [
                            {
                              'title': 'Workouts',
                              'data':
                                  formatToK(current!.totalExerciseLogs ?? 0),
                            },
                            {
                              'title': 'Calories burned',
                              'data':
                                  formatToK(current.totalCaloriesBurned ?? 0)
                            }
                          ];
                          return Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: StatTile(
                              index: index,
                              data: listData[index]['data'].toString(),
                              title: listData[index]['title'] as String,
                            ),
                          );
                        },
                      ),
                    );
                  }),
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
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.exercises!.value.data!.length > 5
                            ? 2
                            : controller.exercises!.value.data!.length,
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
