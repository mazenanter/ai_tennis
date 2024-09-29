class UserRegisterModel {
  final String name;

  final String email;
  final String userId;

  UserRegisterModel(
      {required this.userId, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
    };
  }
}
