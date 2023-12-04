import 'dart:convert';

import 'package:http/http.dart' as http;

class QueryService {
  static const _apiUrl = 'http://127.0.0.1:5000/query';

  Future<void> postQuery(String query) async {
    final Map<String, String> data = {
      'query': query,
    };

    try {
      final response = await http.post(Uri.parse(_apiUrl),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: jsonEncode(data));

      if (response.statusCode == 200) {
        print('POST request successful');
      }
    } catch (e) {
      print(e);
      print("Too bad");
    }
  }
}
