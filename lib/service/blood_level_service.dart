import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BloodLevelService {
  final baseUrl = dotenv.env["BASE_URL"];

  Future<List<Map<String, dynamic>>> getBloodLevels() async {
    final response = await http.get(Uri.parse('$baseUrl/blood_level/entries/'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load blood levels');
    }
  }

  Future<Map> getBloodLevel(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/blood_level/entries/$id/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load blood level');
    }
  }

  Future<Map> createBloodLevel(Map data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/blood_level/entries/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create blood level');
    }
  }

  Future<void> updateBloodLevel(int id, Map data) async {
    final http.Response response = await http.put(
      Uri.parse('$baseUrl/blood_level/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update blood level');
    }
  }

  Future<void> deleteBloodLevel(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('$baseUrl/blood_level_detail/$id/'),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete blood level');
    }
  }
}
