import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class IsInWishlistUseCase {
  final WishlistRepository repository;

  IsInWishlistUseCase(this.repository);

  AsyncBooleanResponse call(String movieId, String userId) {
    return repository.isInWishlist(movieId, userId);
  }
}
