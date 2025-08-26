import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';

abstract class ScenebotRemoteDataSource {
  Future<String> getAIResponse(String prompt);
}

class ScenebotRemoteDataSourceImpl implements ScenebotRemoteDataSource {
  final ApiConsumer apiConsumer;

  ScenebotRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> getAIResponse(String prompt) async {
    final response = await apiConsumer.post(
      EndpointConstants.geminiBaseUrl,
      headers: {"Authorization": "Bearer ${EnvConfig.googleCloudApiKey}"},
      body: {"prompt": prompt, "max_tokens": 200},
    );

    return response['text'] ?? '';
  }
}
