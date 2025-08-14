import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';

abstract class WishlistRepository {
  /// Get all wishlist items for a user
  AsyncListOfDataResponse<WishlistItem> getWishlistItems(String userId);

  /// Add a movie to wishlist
  AsyncSingleDataResponse<WishlistItem> addToWishlist(
    MovieModel movie,
    String userId,
  );

  /// Remove a movie from wishlist
  AsyncVoidResponse removeFromWishlist(String movieId, String userId);

  /// Check if a movie is in wishlist
  AsyncBooleanResponse isInWishlist(String movieId, String userId);

  /// Clear all wishlist items for a user
  AsyncVoidResponse clearWishlist(String userId);

  /// Get wishlist count for a user
  AsyncSingleDataResponse<int> getWishlistCount(String userId);
}
