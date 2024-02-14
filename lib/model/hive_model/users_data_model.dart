class UserData {
  String username;
  int age;
  String address;
  String gender;
  double height;
  double weight;
  String email;
  String imageUrl;
  String description;
  String? phoneNumber;

  UserData(
      {required this.username,
      required this.age,
      required this.address,
      required this.gender,
      required this.height,
      required this.weight,
      required this.email,
      required this.imageUrl,
      required this.description,
      this.phoneNumber});
}
