import 'dart:convert';

import 'package:bts_manager_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static const String _baseUrl = 'https://localhost:7125';

  Future<User> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/api/login');
    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type":"application/json"
      },
      body: jsonEncode({
        'userName': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw Exception('Failed to get access token');
    }
  }
}