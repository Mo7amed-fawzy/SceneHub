import '../../../../core/constants/app_data_types.dart';
import '../../data/models/search_model.dart';
import '../repository/search_repo.dart';

class SearchUseCase {
  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  AsyncSingleDataResponse<SearchingModel> call(String query) async {
    return await searchRepo.search(query);
  }
}
