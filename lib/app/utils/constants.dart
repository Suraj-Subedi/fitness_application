import 'package:fitness_app/app/network/api_endpoints.dart';
import 'package:fitness_app/app/services/app_services.dart';
import 'package:fitness_app/app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Services services = Get.put(AppServices());

void showCustomSnackBar({required String message, int? milliseconds}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: Duration(milliseconds: milliseconds ?? 1000),
  ));
}

String formatImageUrl(String imageUrl) {
  var url = 'http://${APIs.ipAddress}/$imageUrl';
  return url;
}

String getAvatar({required String name, Color? color}) {
  var splitName = name.split(' ');
  return 'https://ui-avatars.com/api/?name=${splitName.first.characters}&length=2&format=png&rounded=true&size=256&background=${color ?? 'D4A373'}&color=${color ?? 'FFFFFF'}';
}

String formatToK(int number) {
  if (number >= 1000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else {
    return number.toString();
  }
}

String? getFormattedDate(DateTime? date) {
  if (date == null) return null;
  var dateParse = DateFormat('yyyy-MM-dd').format(date);
  return dateParse;
}
