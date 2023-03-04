import 'dart:async';
import 'dart:convert';

import 'package:fitness_app/app/models/exercises.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/colors.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/detailed_exercise_controller.dart';

class DetailedExerciseView extends GetView<DetailedExerciseController> {
  const DetailedExerciseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Exercise exercise = Get.arguments;
    var steps = jsonDecode(exercise.steps!.first);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBrown,
          title: Text(exercise.title ?? ''),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    formatImageUrl(exercise.img!),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 2.w,
                    left: 1.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          0.5,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.w,
                        ),
                      ),
                      child: Text(
                        '${exercise.title}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${exercise.calories} kcal',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 25.sp,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              '${exercise.timeToComplete} min',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      exercise.desc!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Steps to follow:',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: steps.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Step ${index + 1}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                width: 70.w,
                                child: Text(
                                  steps[index],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 10.h,
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 2.w,
          ),
          child: ElevatedButton(
            onPressed: () {
              controller.onExerciseStarted(exercise.timeToComplete!);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: darkBrown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.w,
                ),
              ),
            ),
            child: Text(
              'Start Exercise',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}

class CountDownDialog extends StatelessWidget {
  const CountDownDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DetailedExerciseController>();
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Text(
              'Doing exercise',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              child: LottieBuilder.asset(
                Assets.clockLottie,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GetBuilder<DetailedExerciseController>(
                id: 'countdown',
                builder: (controller) {
                  return Text(
                    controller.timerText,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }),
            SizedBox(
              height: 2.h,
            ),
            TextButton(
              onPressed: controller.onExerciseCompleted,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.w,
                  vertical: 4.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(
                    2.w,
                  ),
                ),
                child: Text(
                  'Mark as Completed',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextButton(
              onPressed: controller.onExerciseCancelled,
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ));
  }
}
