import 'package:fitness_app/app/network/api_handler.dart';
import 'package:fitness_app/app/utils/memory_management.dart';
import 'package:fitness_app/app/utils/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();
  await ApiHandler.initDio();
  runApp(
    Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: lightTheme,
      ),
    ),
  );
}
