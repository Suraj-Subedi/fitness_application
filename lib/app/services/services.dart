abstract class Services {
  Future login({required String email, required String password});
  Future register(
      {required String email,
      required String name,
      required String birthdate,
      required double weight,
      required String password});
  Future getUserDetails();
}
