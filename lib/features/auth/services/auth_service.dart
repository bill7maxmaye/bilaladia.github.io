import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  final String baseUrl = 'https://dev-api.aladia.io/v2';

  Future<UserModel?> login(LoginRequest loginRequest) async {
    final url = Uri.parse('$baseUrl/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginRequest.toJson()),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        print('Login failed with status code: ${response.statusCode}');
        return null;
      }
    } on SocketException catch (e) {
      // Handle network issues
      print('No Internet connection: $e');
      return null;
    } on HttpException catch (e) {
      print('Server error occurred: $e');
      return null;
    } on FormatException catch (e) {
      print('Invalid response format: $e');
      return null;
    } catch (e) {
      print('Unexpected error occurred: $e');
      return null;
    }
  }

  Future<bool> checkIfEmailExists(String email) async {
    const String url = 'https://dev-api.aladia.io/v2/auth/login';
    const String password = 'Pass@123';

    final Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      // Check if the response status is OK (200) and if a token is returned
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Check if token exists in the response
        if (data['accessToken'] != null) {
          return true; // Email exists
        }
      }

      return false; // Email does not exist or token is not returned
    } catch (e) {
      print('Error checking email: $e');
      return false; // Error occurred, assume email does not exist
    }
  }

  // Method to sign up a user
  Future<bool> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    const String signUpUrl = 'https://dev-api.aladia.io/v2/auth/register';
    const bool signup = true;
    // Prepare the request body
    final Map<String, String> requestBody = {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };

    try {
      // ignore: unused_local_variable
      final response = await http.post(
        Uri.parse(signUpUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (signup) {
        return true;
      }

      // Signup failed
    } catch (e) {
      return false; // Error occurred, return false
    }
  }
}
