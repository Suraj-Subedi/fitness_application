import 'package:fitness_app/app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;

  final Function()? onPressed;
  const CustomButton(
      {super.key, required this.title, this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: darkBrown,
          borderRadius: BorderRadius.circular(2.w),
        ),
        width: double.infinity,
        height: 7.h,
        child: isLoading
            ? Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 0.75.w,
                    color: Colors.white,
                  ),
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
      ),
    );
  }
}
