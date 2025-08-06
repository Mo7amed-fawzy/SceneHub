// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // want to send some custom headers or modify the request
    options.headers['Authorization'] =
        '	Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTBkN2JlYWIwYzg2ZTVkYjg5OTJhYzc4NTVlOGZmYyIsIm5iZiI6MTc1NDMwNjMzOC43ODcwMDAyLCJzdWIiOiI2ODkwOTcyMjE4ODFhMGMxMDMxMWUwYTYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.j-wpLS0iJe2Xe3-WOkO7pmlYMBqraE55ZyTBn0GuK3o';
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
