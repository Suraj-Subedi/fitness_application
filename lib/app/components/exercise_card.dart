import 'package:fitness_app/app/components/search_box.dart';
import 'package:fitness_app/app/models/exercises.dart';
import 'package:fitness_app/app/routes/app_pages.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/colors.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:fitness_app/app/utils/memory_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class ExerciseCard extends StatelessWidget {
  final bool isFavorite;
  final Exercise exercise;
  final bool isSuggestions;
  final String? query;
  const ExerciseCard(
      {super.key,
      this.isFavorite = false,
      required this.exercise,
      this.isSuggestions = false,
      this.query});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSuggestions) {
          MemoryManagement.addRecentSearch(search: query!);
          searchController.getRecentSarches();
        }
        Get.toNamed(Routes.DETAILED_EXERCISE, arguments: exercise);
      },
      child: AspectRatio(
        aspectRatio: 2.15,
        child: Container(
          width: 100.w,
          margin: EdgeInsets.only(
            bottom: 5.w,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(formatImageUrl(exercise.img ?? '')),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 2.w,
                  ),
                  decoration: const BoxDecoration(
                    color: lightBrown,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exercise.title ?? '',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 35.w,
                        child: Text(exercise.desc ?? '',
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.schedule),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            '${exercise.timeToComplete} min',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
