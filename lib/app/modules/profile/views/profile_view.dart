import 'package:fitness_app/app/components/custom_textButton.dart';
import 'package:fitness_app/app/components/custom_textfield.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.w,
            ),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      Assets.profileImage,
                    ),
                    radius: 18.w,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                    title: '',
                    hintText: 'Dev Joshi',
                    controller: controller.nameController),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                  title: '',
                  hintText: 'Dev@gmail.com',
                  controller: controller.emailController,
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                  title: '',
                  hintText: '1999-01-01',
                  controller: controller.birthDateController,
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(
                    title: '',
                    hintText: '80 KG',
                    controller: controller.weightController),
                SizedBox(
                  height: 1.h,
                ),
                CustomButton(title: 'Log Out', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
