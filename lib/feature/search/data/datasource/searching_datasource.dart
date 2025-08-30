import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/feature/search/data/models/search_model.dart';

import '../../../../core/constants/cache_keys.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/utils/api_keys.dart';

abstract class SearchingDataSource {
  Future<SearchingModel> search(String query);
}

class SearchingDataSourceImpl implements SearchingDataSource {
  ApiConsumer apiConsumer;

  SearchingDataSourceImpl(this.apiConsumer);

  @override
  Future<SearchingModel> search(String query) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.search}',
      queryParameters: {'query': query, CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );
    if (response == null) {
      throw Exception('Failed to load search results');
    }
    final searchingModel = SearchingModel.fromJson(response);
    return searchingModel;
  }
}
