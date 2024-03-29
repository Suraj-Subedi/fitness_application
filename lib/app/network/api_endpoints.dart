class APIs {
  static const String ipAddress = "192.168.1.70:5001";
  static const String baseUrl = "http://$ipAddress/api";
  static const String login = "/auth/login";
  static String getUserDetails = "/users/find/";
  static const String register = "/auth/register";
  static String updateUserDetails = "/users/";
  static String exercises = "/exercises";
  static String exerciseLog = "/exercise_log/";
  static String stats = "/exercise_log/stats/";
  static String favourites = "/fav/";
  static String changePassword = "/auth/changePassword/";
}
