import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meteor_app/models/base_model.dart';
import 'package:meteor_app/models/auth_model.dart';

class ApiClient {
  static const String baseUrl =
      'http://localhost:4000'; // Thay bằng URL API của bạn

  // Gửi yêu cầu đăng nhập
  static Future<BaseModel<AuthResponse>> login<T>(
    String email,
    String password,
  ) async {
    final Uri url = Uri.parse('$baseUrl/users/login');
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Đăng nhập thành công, trả về BaseModel
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return BaseModel<AuthResponse>.fromJson(
          jsonResponse,
          (json) => AuthResponse.fromJson(json as Map<String, dynamic>),
        );
      } else {
        throw HttpException('Failed to login');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Lấy thông tin cá nhân (get/me) ví dụ
  static Future<BaseModel<T>> getUserInfo<T>(
    String accessToken,
    T Function(Object? json) fromJsonT,
  ) async {
    final Uri url = Uri.parse('$baseUrl/user/me');
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken', // Truyền token trong header
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Trả về BaseModel chứa dữ liệu người dùng
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return BaseModel<T>.fromJson(jsonResponse, fromJsonT);
      } else {
        throw HttpException('Failed to fetch user info');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
