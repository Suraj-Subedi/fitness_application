import 'package:fitness_app/app/components/custom_textButton.dart';
import 'package:fitness_app/app/components/custom_textfield.dart';
import 'package:fitness_app/app/routes/app_pages.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7.5.w, horizontal: 3.5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'TELL ABOUT YOURSELF',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  controller: controller.nameController,
                  title: '',
                  hintText: 'Full Name',
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  controller: controller.emailController,
                  title: '',
                  hintText: 'Enter your email',
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  controller: controller.birthdateController,
                  title: '',
                  readOnly: true,
                  hintText: 'Your birthdate',
                  textInputAction: TextInputAction.next,
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime(2000),
                              firstDate: DateTime(1920),
                              lastDate: DateTime.now())
                          .then((v) => {
                                {
                                  if (v != null)
                                    {
                                      controller.birthdateController.text =
                                          getFormattedDate(v),
                                      FocusScope.of(context).nextFocus()
                                    }
                                }
                              });
                    },
                    child: const Icon(
                      Icons.calendar_today,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  controller: controller.weightController,
                  title: '',
                  hintText: 'Enter your weight',
                  textInputAction: TextInputAction.next,
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('KG'),
                    ],
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  controller: controller.passwordController,
                  title: '',
                  hintText: 'Enter your password',
                  textInputAction: TextInputAction.done,
                  isPassword: true,
                ),
                SizedBox(height: 3.h),
                CustomButton(
                  title: 'Register',
                  onPressed: () {},
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
