class UserModel {
  final String? email;
  final String? accessToken;

  UserModel({
    required this.email,
    required this.accessToken,
  });

  // Factory constructor to create a user model from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      accessToken: json['accessToken'],
    );
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  // Convert request data to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
