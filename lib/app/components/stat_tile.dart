import 'package:fitness_app/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class StatTile extends StatelessWidget {
  final int index;
  final String data;
  final String title;
  const StatTile(
      {super.key,
      required this.index,
      required this.data,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 43.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: index % 2 == 0 ? regular : darkGreen,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: TextStyle(
              fontSize: 55.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
