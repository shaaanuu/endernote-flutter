import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../api_key.dart';

class FirebaseAuthService {
  final String apiKey = firebaseWebApi;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // Sign-Up
  Future<Map<String, dynamic>> signUp(String email, String password) async {
    final url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey",
    );

    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      await _saveTokens(data);
      return data;
    } else {
      throw Exception(data['error']['message']);
    }
  }

  // Sign-In
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey",
    );

    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      await _saveTokens(data);
      return data;
    } else {
      throw Exception(data['error']['message']);
    }
  }

  // Refresh Token
  Future<String> refreshToken(String refreshToken) async {
    final url = Uri.parse(
      "https://securetoken.googleapis.com/v1/token?key=$apiKey",
    );

    final response = await http.post(
      url,
      body: json.encode({
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      await _saveTokens(data);
      return data['id_token'];
    } else {
      throw Exception(data['error']['message']);
    }
  }

  // Save Tokens Securely
  Future<void> _saveTokens(Map<String, dynamic> data) async {
    await secureStorage.write(
      key: "idToken",
      value: data['id_token'],
    );
    await secureStorage.write(
      key: "refreshToken",
      value: data['refresh_token'],
    );
    await secureStorage.write(
      key: "localId",
      value: data['localId'],
    );
  }
}
