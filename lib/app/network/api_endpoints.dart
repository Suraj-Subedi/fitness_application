import 'package:fitness_app/app/utils/memory_management.dart';

class APIs {
  static const String ipAddress = "http://192.168.1.66:5000";
  static const String baseUrl = "$ipAddress/api";
  static const String login = "/auth/login";
  static String getUserDetails = "/users/find/${MemoryManagement.getUserId()}";
}
