import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:meteor_app/utils/app_shared.dart';

class Retrofit extends DioForNative {
  static const String keyAuth = "Authorization";
  static const String keyAccept = "Accept";
  static const String keyContentType = "Content-Type";
  Retrofit({String? baseUrl, BaseOptions? options}) : super(options) {
    interceptors.add(
      InterceptorsWrapper(onRequest: _requestInterceptor),
    );
  }
  void _requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers.containsKey(keyAuth)) {
      options.headers.remove(keyAuth);
    }
    options.headers[keyAccept] = "application/json";
    options.headers[keyContentType] = "application/json";
    String? accessToken = await TokenManager.getAccessToken();
    if (accessToken == null) {
      handler.next(options);
      return;
    }
    options.headers[keyAuth] = "Bearer $accessToken";
    options.connectTimeout = const Duration(minutes: 1);
    options.receiveTimeout = const Duration(minutes: 1);
    handler.next(options); //continue
  }
}
