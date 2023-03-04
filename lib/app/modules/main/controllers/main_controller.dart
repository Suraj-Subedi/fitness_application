// ignore_for_file: deprecated_member_use

import 'package:fitness_app/app/modules/favourite/views/favourite_view.dart';
import 'package:fitness_app/app/modules/home/views/home_view.dart';
import 'package:fitness_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:fitness_app/app/modules/profile/views/profile_view.dart';
import 'package:fitness_app/app/modules/search/views/search_view.dart';
import 'package:fitness_app/app/utils/assets.dart';
import 'package:fitness_app/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class MainController extends GetxController {
  final count = 0.obs;

  Rx<bool> autofocus = false.obs;

  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  TextStyle navButton = TextStyle(
      fontFamily: 'Poppins',
      foreground: Paint()..color = backgroundColor,
      fontSize: 12.sp);

  final screens = [
    const HomeView(),
    const SearchView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  List<PersistentBottomNavBarItem> navBarsItems() {
    double iconHeight = 17.sp;
    Color activeColor = Colors.white;
    Color inactiveColor = Colors.black;
    // double inactiveHeight = isMobile() ? 20.sp : 15.sp;

    return [
      tabItem(
        'Home',
        icon: SvgPicture.asset(
          Assets.homeIcon,
          height: iconHeight,
          color: activeColor,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.homeIcon,
          height: iconHeight,
          color: inactiveColor,
        ),
      ),
      tabItem(
        'Search',
        icon: SvgPicture.asset(
          Assets.searchIcon,
          height: iconHeight,
          color: activeColor,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.searchIcon,
          height: iconHeight,
          color: inactiveColor,
        ),
      ),
      tabItem(
        'Favourite',
        icon: SvgPicture.asset(
          Assets.favouriteIcon,
          height: iconHeight,
          color: activeColor,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.favouriteIcon,
          height: iconHeight,
          color: inactiveColor,
        ),
      ),
      tabItem(
        'Profile',
        icon: SvgPicture.asset(
          Assets.profileIcon,
          height: iconHeight,
          color: activeColor,
        ),
        inactiveIcon: SvgPicture.asset(
          Assets.profileIcon,
          height: iconHeight,
          color: inactiveColor,
        ),
      ),
    ];
  }

  PersistentBottomNavBarItem tabItem(title,
      {required Widget icon, screen, required Widget inactiveIcon}) {
    return PersistentBottomNavBarItem(
      title: title,
      textStyle: navButton,
      inactiveIcon: inactiveIcon,
      icon: icon,
      activeColorPrimary: darkBrown,
    );
  }

  @override
  void onInit() {
    super.onInit();
    Get.put(ProfileController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
