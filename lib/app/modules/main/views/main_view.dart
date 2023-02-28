import 'package:fitness_app/app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      context,

      navBarHeight: 8.h,

      screens: controller.screens,
      items: controller.navBarsItems(),
      confineInSafeArea: true,

      // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        boxShadow: [
          // BoxShadow(
          //   color: Theme.of(context).shadowColor,
          //   spreadRadius: 1,
          //   blurRadius: 1,
          // )
        ],
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(4.w),
        //   topRight: Radius.circular(4.w),
        // ),
        // colorBehindNavBar: Colors.red,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    ));
  }
}
