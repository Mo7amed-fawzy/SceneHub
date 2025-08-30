import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../../data/models/search_model.dart';

abstract class SearchRepo {
  AsyncSingleDataResponse<SearchingModel> search(String query);
}
