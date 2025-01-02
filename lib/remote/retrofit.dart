import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Retrofit extends DioForNative {
  Retrofit({String? baseUrl, BaseOptions? options}) : super(options) {
    // Define global interceptors for app
  }
}
