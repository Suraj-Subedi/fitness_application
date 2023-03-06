import 'package:fitness_app/app/components/custom_textButton.dart';
import 'package:fitness_app/app/components/custom_textfield.dart';
import 'package:fitness_app/app/routes/app_pages.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/colors.dart';
import 'package:fitness_app/app/utils/constants.dart';
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
        // actions: [
        //   PopupMenuButton(
        //       shadowColor: Colors.black,
        //       elevation: 5,
        //       color: lightBrown,
        //       icon: const Icon(
        //         Icons.settings,
        //         color: Colors.black,
        //       ),
        //       itemBuilder: (context) {
        //         var style = TextStyle(color: Colors.black);
        //         return [
        //           PopupMenuItem(
        //             child: TextButton(
        //               onPressed: () async {
        //                 Get.back();
        //                 await Get.toNamed(Routes.EDIT_PROFILE,
        //                     arguments: controller.user?.value.data);
        //               },
        //               child: Text(
        //                 'Edit Profile',
        //                 style: style,
        //               ),
        //             ),
        //           ),
        //           PopupMenuItem(
        //             child: TextButton(
        //               onPressed: () {
        //                 Get.back();
        //                 // Get.toNamed(Routes.CHANGE_PASSWORD);
        //               },
        //               child: Text(
        //                 'Change Password',
        //                 style: style,
        //               ),
        //             ),
        //           ),
        //           PopupMenuItem(
        //             child: TextButton(
        //               onPressed: () {
        //                 Get.back();
        //                 controller.onLogout();
        //               },
        //               child: Text(
        //                 'Logout',
        //                 style: style,
        //               ),
        //             ),
        //           ),
        //         ];
        //       })
        // ],
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
                    children: [
                      Center(
                        child: Hero(
                          tag: 'profilePic',
                          child: CircleAvatar(
                            backgroundColor: Color(0xffD4A373),
                            backgroundImage: NetworkImage(
                                getAvatar(name: data?.fullName ?? 'User')),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              onPressed: () async {
                                await Get.toNamed(Routes.EDIT_PROFILE,
                                    arguments: data);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 1.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: TextButton(
                                onPressed: () async {
                                  await Get.toNamed(Routes.CHANGE_PASSWORD,
                                      arguments: data);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 1.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    'Change Password',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                          readOnly: true,
                          title: '',
                          hintText: '',
                          controller: controller.nameController),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        readOnly: true,
                        title: '',
                        hintText: data?.email ?? '',
                        controller: controller.emailController,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                        readOnly: true,
                        title: '',
                        hintText: getFormattedDate(data?.birthDate) ?? '',
                        controller: controller.birthDateController,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(
                          readOnly: true,
                          title: '',
                          hintText: '${data?.weight} KG',
                          controller: controller.weightController),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomButton(
                          title: 'Log Out',
                          onPressed: () {
                            controller.onLogout();
                          }),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
