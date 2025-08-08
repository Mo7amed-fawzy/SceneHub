import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlistCountUseCase {
  final WishlistRepository repository;

  GetWishlistCountUseCase(this.repository);

  AsyncSingleDataResponse<int> call(String userId) {
    return repository.getWishlistCount(userId);
  }
}
