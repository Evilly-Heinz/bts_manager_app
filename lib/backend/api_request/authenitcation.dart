import 'dart:convert';
import 'package:bts_manager_app/backend/api_request/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bts_manager_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<User> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/login');
    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode({
        'userName': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responeBody = jsonDecode(response.body);
      final user = User.fromJson(responeBody['data']);
      return user;
    } else {
      throw Exception('Failed to get access token');
    }
  }

  Future<void> storeAccessToken(String accessToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'accessToken', value: accessToken);
  }

  Future<String?> getAccessToken() async {
    const storage = FlutterSecureStorage();
    final tokenExist = await storage.containsKey(key: 'accessToken');
    if (!tokenExist) {
      return null;
    }
    final token = await storage.read(key: 'accessToken');
    if (isAccessTokenExpired(token!)) {
      await storage.delete(key: 'accessToken');
      return null;
    }
    return token;
  }

  bool isAccessTokenExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token format');
    }
    final payload = parts[1];
    final decodedPayload = base64Url.decode(payload);
    final payloadMap = jsonDecode(utf8.decode(decodedPayload));
    final exp = payloadMap['exp'];
    if (exp == null) {
      throw Exception('Expiration date not found in token');
    }
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    final now = DateTime.now();
    final expirationDateAfterOneHour = now.add(const Duration(hours: 1));
    return expirationDate.isBefore(expirationDateAfterOneHour);
  }
}
