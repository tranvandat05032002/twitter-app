import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meteor_app/models/base_model.dart';
import 'package:meteor_app/models/auth_model.dart';
import 'package:meteor_app/models/tweet_model.dart';
import 'package:meteor_app/models/user_model.dart';

class ApiClient {
  static const String baseUrl = 'http://localhost:4000';

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
  static Future<BaseModel<UserInfo>> getUserInfo<T>(String accessToken) async {
    final Uri url = Uri.parse('$baseUrl/users/me');
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken', // Truyền token trong header
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final user = jsonResponse['result']['user'];
        return BaseModel<UserInfo>.fromJson(
          jsonResponse,
          (json) => UserInfo.fromJson(user as Map<String, dynamic>),
        );
      } else {
        throw HttpException('Failed to fetch user info');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Lay danh sach tweet
  static Future<Result> getTweets(
      {required int limit,
      required int page,
      required String accessToken}) async {
    final Uri url = Uri.parse('$baseUrl/tweet?limit=$limit&page=$page');

    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var tweets = data['result'];
      return Result.fromJson(tweets);
    } else {
      throw Exception('Failed to load tweets');
    }
  }

  // Dang tweet
  static Future<bool> postTweet({
    required int type,
    required int audience,
    required String content,
    String? parentId,
    required List<String> hashtags,
    required List<String> mentions,
    required List<Media> medias,
    required String accessToken,
  }) async {
    bool checkPostTweet = false;

    final Uri url = Uri.parse('$baseUrl/tweet');
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    final Map<String, dynamic> tweetData = {
      'type': type,
      'audience': audience,
      'content': content,
      'parent_id': parentId,
      'hashtags': hashtags,
      'mentions': mentions,
      'medias': medias,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(tweetData),
    );

    if (response.statusCode == 200) {
      checkPostTweet = true;
      // final data = jsonDecode(response.body);
      // var result = Result.fromJson(data['result']);
      return checkPostTweet;
    } else {
      throw Exception('Failed to post tweet');
    }
  }
}
