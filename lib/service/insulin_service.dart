import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

//     {
//         "id": 6, "name": "Rapid-acting"
//     },
//     {
//         "id": 7, "name": "Short-acting"
//     },
//     {
//         "id": 8, "name": "Intermediate-acting"
//     },
//     {
//         "id": 9, "name": "Long-acting"
//     },
//     {
//         "id": 10,  "name": "Pre-mixed"
//     }

class InsulinService {
  final baseUrl = dotenv.env["BASE_URL"];

  Future<List<Map<String, dynamic>>> getInsulinTakes() async {
    final response = await http.get(Uri.parse('$baseUrl/insulin/takes/'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load insulin takes');
    }
  }

  Future<Map> getInsulinTake(int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/blood_level/entries/$id/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load insulin takes');
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
