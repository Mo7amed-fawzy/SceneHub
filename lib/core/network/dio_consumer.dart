import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/endpoint_constants.dart';
import '../errors/exceptions.dart';
import 'api_consumer.dart';
import 'interceptors.dart';
import 'status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndpointConstants.baseUrl
      ..responseType = ResponseType.json
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15);

    client.interceptors.add(AppInterceptors());

    if (kDebugMode) {
      client.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
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

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.put(path, data: body);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      final response = await client.delete(path);
      return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const ServerException('Connection timeout');
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const ServerException('Bad request');
          case StatusCode.unauthorized:
            throw const ServerException('Unauthorized');
          case StatusCode.forbidden:
            throw const ServerException('Forbidden');
          case StatusCode.notFound:
            throw const ServerException('Not found');
          case StatusCode.conflict:
            throw const ServerException('Conflict');
          case StatusCode.internalServerError:
            throw const ServerException('Internal server error');
          default:
            throw const ServerException('Unknown error');
        }
      case DioExceptionType.cancel:
        throw const ServerException('Request cancelled');
      case DioExceptionType.connectionError:
        throw const ServerException('No internet connection');
      default:
        throw const ServerException('Unknown error occurred');
    }
  }
}
