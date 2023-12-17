import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final baseUrl = dotenv.env["BASE_URL"];

  Future<Map<String, dynamic>> sendQuestion(String questionText) async {
    final Map<String, dynamic> data = {
      "user": 1,
      "question_text": questionText,
    };

    try {
      final response = await http.post(Uri.parse('$baseUrl/ai/send_question/'),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(data));

      if (response.statusCode == 201) {
        log('Successfully sent POST request');
        final Map<String, dynamic> result = jsonDecode(response.body);
        return result;
      }
    } catch (e) {
      log(e.toString());
      log('Something went wrong');
      return {"question_text": "", "answer_text": ""};
    }
    return {"question_text": "", "answer_text": ""};
  }

  Future<List<dynamic>> loadQuestion({int uid = 1}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/ai/chats/$uid'));
      if (response.statusCode == 200) {
        final List<dynamic> res = jsonDecode(response.body);
        final List<Map<String, dynamic>> mappedList = res
            .map((e) => {
                  "id": e["id"],
                  "user_id": e["user"],
                  "question_text": e["question_text"],
                  "answer_text": e["answer_text"],
                  "timestamp": e["timestamp"],
                })
            .toList();
        return mappedList;
      }
    } catch (e) {
      log(e.toString());
      return ["Unable to load questions"];
    }
    return [];
  }
}
