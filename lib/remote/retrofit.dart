import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Retrofit extends DioForNative {
  Retrofit({
    String? baseUrl,
    BaseOptions? options,
  }) : super(options) {
    // interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: _onRequestInterceptor,
    //     onError: _onErrorInterceptor,
    //   ),
    // );
    // if (baseUrl == AppConst.baseUrl) {
    //   final CacheOptions cacheOptions = CacheOptions(
    //     store: MemCacheStore(),
    //     policy: CachePolicy.request,
    //     hitCacheOnErrorExcept: [401, 403],
    //     maxStale: const Duration(days: 30),
    //     priority: CachePriority.high,
    //   );
    //   interceptors.add(DioCacheInterceptor(options: cacheOptions));
    // }
  }
}