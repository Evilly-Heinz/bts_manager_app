import 'dart:convert';

import 'package:bts_manager_app/models/setting.dart';
import 'package:http/http.dart' as http;

class SettingMgr {
  static const String _baseUrl = 'https://localhost:7125';
  //static const String _baseUrl = 'https://cloudbts.info';
  final String accessToken;

  SettingMgr(this.accessToken);
  Future<Setting> getSetting() async {
    final url = Uri.parse('$_baseUrl/api/setting');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (response.statusCode == 200) {
      final responeBody = jsonDecode(response.body);
      return Setting.fromJson(responeBody);
    } else {
      // Handle the error case
      throw Exception('Failed to get setting: ${response.statusCode}');
    }
  }
}
