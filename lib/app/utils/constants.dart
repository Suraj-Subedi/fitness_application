import 'package:fitness_app/app/services/app_services.dart';
import 'package:fitness_app/app/services/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Services services = Get.put(AppServices());

void showCustomSnackBar({required String message, int? milliseconds}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: Duration(milliseconds: milliseconds ?? 1000),
  ));
}

String getFormattedDate(DateTime date) {
  var dateParse = DateFormat('yyyy-MM-dd').format(date);
  return dateParse;
}
