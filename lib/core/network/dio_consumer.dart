import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/endpoint_constants.dart';
import 'api_consumer.dart';
import 'interceptors.dart';
// import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndpointConstants.baseUrl
      ..responseType = ResponseType.json
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);

    client.interceptors.add(AppInterceptors());
    client.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  // Implement other methods (post, put, delete)

  void _handleDioError(DioException error) {
    // Handle different error types
  }

  @override
  Future delete(String path) async {
    try {
      final response = await client.delete(path);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.put(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }
}
