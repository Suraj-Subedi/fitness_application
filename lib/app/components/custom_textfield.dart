import 'package:fitness_app/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final Widget? suffix;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.isPassword = false,
      this.suffix,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 6.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 1.w,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? !isVisible : false,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            fillColor: textFieldBackground,
            filled: true,
            suffix: widget.suffix,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              color: textFieldHintColor,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      size: 13.sp,
                      color: Colors.black,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.w),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide(
                color: Colors.grey.shade500,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.w),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
