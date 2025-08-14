import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class ClearWishlistUseCase {
  final WishlistRepository repository;

  ClearWishlistUseCase(this.repository);

  AsyncVoidResponse call(String userId) {
    return repository.clearWishlist(userId);
  }
}
