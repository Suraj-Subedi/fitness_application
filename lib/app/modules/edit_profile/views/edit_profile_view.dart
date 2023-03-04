import 'package:fitness_app/app/components/custom_textButton.dart';
import 'package:fitness_app/app/components/custom_textfield.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';

import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/colors.dart';
import 'package:fitness_app/app/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var editProfileController = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ProfileController>(
            id: 'profile',
            builder: (controller) {
              if (controller.user == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              var data = controller.user?.value.data;

              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 5.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Hero(
                          tag: 'profilePic',
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              getAvatar(name: data?.fullName ?? 'User'),
                            ),
                            radius: 18.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        data?.fullName ?? 'User',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomTextField(
                          hintText: '',
                          title: '',
                          controller: editProfileController.nameController),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        readOnly: true,
                        title: '',
                        hintText: data?.email ?? '',
                        controller: editProfileController.emailController,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        readOnly: true,
                        title: '',
                        hintText: getFormattedDate(data?.birthDate) ?? '',
                        controller: editProfileController.birthDateController,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            showDatePicker(
                                    context: context,
                                    initialDate: controller
                                            .birthDateController.text.isNotEmpty
                                        ? DateTime.parse(
                                            controller.birthDateController.text)
                                        : DateTime.now(),
                                    firstDate: DateTime(1920),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary: darkBrown,
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                    lastDate: DateTime.now())
                                .then((v) => {
                                      {
                                        if (v != null)
                                          {
                                            editProfileController
                                                .birthDateController
                                                .text = getFormattedDate(v)!,
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
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        title: '',
                        hintText: '${data?.weight} KG',
                        controller: editProfileController.weightController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Obx(
                        () => CustomButton(
                            title: 'Save',
                            isLoading: editProfileController.isLoading.value,
                            onPressed: () async {
                              await editProfileController.updateUser();
                            }),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
