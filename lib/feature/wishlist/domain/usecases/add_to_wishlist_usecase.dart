import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class AddToWishlistUseCase {
  final WishlistRepository repository;

  AddToWishlistUseCase(this.repository);

  AsyncSingleDataResponse<WishlistItem> call(MovieModel movie, String userId) {
    return repository.addToWishlist(movie, userId);
  }
}
