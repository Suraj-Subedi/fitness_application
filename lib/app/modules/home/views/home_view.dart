import 'package:fitness_app/app/components/exercise_card.dart';
import 'package:fitness_app/app/components/search_box.dart';
import 'package:fitness_app/app/components/stat_tile.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                      Text('Hello Dave'),
                      Text(
                        'Lets Workout',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 5.w,
                    backgroundImage: const NetworkImage(
                      Assets.profileImage,
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ExerciseCard();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
