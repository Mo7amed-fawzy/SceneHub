import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';

import '../entities/movies_details_entity.dart';

class GetDetailsParams {
  final int id;
  final String mediaType;

  GetDetailsParams({required this.id, required this.mediaType});
}

class GetDetailsUseCase {
  final HomeMediaRepository repository;

  GetDetailsUseCase(this.repository);

  Future<HomeMediaEntity> call(GetDetailsParams params) {
    return repository.getDetails(params.id, params.mediaType);
  }
}
