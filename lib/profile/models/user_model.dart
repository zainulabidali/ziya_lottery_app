class UserModel {
  final String name;
  final String phone;
  final String location;
  final String plan;
  final bool isActive;

  UserModel({
    required this.name,
    required this.phone,
    required this.location,
    required this.plan,
    this.isActive = true,
  });
}
