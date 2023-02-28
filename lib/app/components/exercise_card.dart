import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class ExerciseCard extends StatelessWidget {
  final bool isFavorite;
  const ExerciseCard({super.key, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
                    image: NetworkImage(Assets.testImage),
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
                decoration: BoxDecoration(
                  color: lightBrown,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Upper abs workout',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      width: 35.w,
                      child: Text(
                          'This is very good workout for building core strong as well as immune power.',
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '30 min',
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
    );
  }
}
