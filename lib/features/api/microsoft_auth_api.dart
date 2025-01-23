// C:\Users\desarrollo\Desktop\repositorios\flutter-microsoft-template\lib\features\api\microsoft_auth_api.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class MicrosoftAuthApi {
  static const String apiBaseUrl = 'http://localhost:3001/api/auth';

  static Future<String?> getMicrosoftAuthUrl() async {
    try {
      final response = await http.get(
        Uri.parse('$apiBaseUrl/login'),
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['url'];
      } else {
        throw Exception('Error al obtener la URL de autenticación de Microsoft');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> handleAuthenticationCallback(String callbackUrl) async {
    try {
      final response = await http.get(Uri.parse(callbackUrl));
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error en la autenticación');
      }
    } catch (e) {
      print('Error en callback: $e');
      return null;
    }
  }
}