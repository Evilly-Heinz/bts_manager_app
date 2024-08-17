import 'dart:convert';

import 'package:bts_manager_app/models/center_control.dart';
import 'package:http/http.dart' as http;

class CenterControlManager {
  static const String baseUrl = 'https://localhost:7125';
  // static const String baseUrl = 'https://cloudbts.info';
  final String accessToken;

  CenterControlManager(this.accessToken);
  Future<List<CenterControl>> searchCenterControls() async {
    final url = Uri.parse('$baseUrl/api/center-control/search');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      if (response.statusCode == 200) {
        // Parse the response body and return a list of CenterControl objects
        // You can customize this part based on your API response structure
        final List<dynamic> json = jsonDecode(response.body);
        final List<CenterControl> centerControls =
            json.map((data) => CenterControl.fromJson(data)).toList();
        return centerControls;
      } else {
        throw Exception('Failed to load center controls');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<CenterControl> getCenterControl(String id) async {
    final url = Uri.parse('$baseUrl/api/center-control/$id');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return CenterControl.fromJson(json);
      } else {
        throw Exception('Failed to load center control');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
