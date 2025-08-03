import 'package:dio/dio.dart';
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
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
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
  Future delete(String path) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future post(String path, {Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String path, {Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
