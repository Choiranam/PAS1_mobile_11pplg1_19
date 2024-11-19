import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl = 'https://mediadwi.com/api/latihan';

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/login'));

      request.fields['username'] = username;
      request.fields['password'] = password;

      request.headers.addAll({
        'Accept': '*/*',
      });

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      // Debugging (Opsional)
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {
          'status': false,
          'message': 'Login failed. Status code: ${response.statusCode}',
        };
      }
    } catch (e) {
      print('Exception: $e');
      return {
        'status': false,
        'message': 'An error occurred. Please try again later.',
      };
    }
  }
}
