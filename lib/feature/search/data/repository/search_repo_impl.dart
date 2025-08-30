import 'package:ai_movie_app/feature/search/domain/repository/search_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_data_types.dart';
import '../../../../core/errors/failures.dart';
import '../datasource/searching_datasource.dart';
import '../models/search_model.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchingDataSource searchingDataSource;

  SearchRepoImpl(this.searchingDataSource);

  @override
  AsyncSingleDataResponse<SearchingModel> search(String query) async {
    try {
      final response = await searchingDataSource.search(query);
      return Right(response);
    } on FormatException catch (_) {
      return Left(FormatFailure('Invalid data format received'));
    } on Exception catch (_) {
      return Left(ServerFailure('Failed to fetch search results'));
    }
  }
}
