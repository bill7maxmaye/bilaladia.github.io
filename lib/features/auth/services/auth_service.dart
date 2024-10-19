// services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  final String baseUrl =
      'https://dev-api.aladia.io/v2'; 

  // Login user
  Future<UserModel?> login(LoginRequest loginRequest) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      // Parse the response and return a UserModel
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // Handle different status codes
      print('Login failed: ${response.statusCode}');
      return null;
    }
  }
}
