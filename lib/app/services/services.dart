abstract class Services {
  Future login({required String email, required String password});
  Future register(
      {required String email,
      required String name,
      required String birthdate,
      required double weight,
      required String password});
  Future getUserDetails();
  Future updateUserDetails({
    required String name,
    required String birthdate,
    required double weight,
  });
  Future getExercises();
  Future addEerciseLog({
    required String exerciseId,
    required int timeToComplete,
    required int calories,
    required String title,
  });

  Future changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  });

  Future getStatsById({required bool isThisWeek});

  Future addToFavourites({required String exerciseId});
  Future removeFromFavourites({required String exerciseId});
}
