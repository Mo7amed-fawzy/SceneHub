// ignore_for_file: unnecessary_overrides

import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // want to send some custom headers or modify the request
    options.headers['Authorization'] = EnvConfig.tmdbApiKey;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
