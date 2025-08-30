import '../entities/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<List<WishlistEntity>> getWishlistItems(String userId);
  Future<WishlistEntity> addToWishlist(WishlistEntity movie, String userId);
  Future<void> removeFromWishlist(int movieId, String userId);
  Future<bool> isInWishlist(int movieId, String userId);
  Future<void> clearWishlist(String userId);
  Future<int> getWishlistCount(String userId);
}
