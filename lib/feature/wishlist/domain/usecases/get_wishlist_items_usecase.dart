import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlistItemsUseCase {
  final WishlistRepository repository;

  GetWishlistItemsUseCase(this.repository);

  AsyncListOfDataResponse<WishlistItem> call(String userId) {
    return repository.getWishlistItems(userId);
  }
}
