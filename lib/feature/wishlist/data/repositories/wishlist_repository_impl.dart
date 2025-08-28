import '../../domain/entities/wishlist_entity.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_local_data_source.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistLocalDataSource localDataSource;

  WishlistRepositoryImpl({required this.localDataSource});

  @override
  Future<List<WishlistEntity>> getWishlistItems(String userId) async {
    try {
      return await localDataSource.getWishlistItems(userId);
    } catch (e) {
      throw Exception('Failed to get wishlist items: $e');
    }
  }

  @override
  Future<WishlistEntity> addToWishlist(
    WishlistEntity movie,
    String userId,
  ) async {
    try {
      return await localDataSource.addToWishlist(movie, userId);
    } catch (e) {
      throw Exception('Failed to add movie to wishlist: $e');
    }
  }

  @override
  Future<void> removeFromWishlist(int movieId, String userId) async {
    try {
      await localDataSource.removeFromWishlist(movieId, userId);
    } catch (e) {
      throw Exception('Failed to remove movie from wishlist: $e');
    }
  }

  @override
  Future<bool> isInWishlist(int movieId, String userId) async {
    try {
      return await localDataSource.isInWishlist(movieId, userId);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> clearWishlist(String userId) async {
    try {
      await localDataSource.clearWishlist(userId);
    } catch (e) {
      throw Exception('Failed to clear wishlist: $e');
    }
  }

  @override
  Future<int> getWishlistCount(String userId) async {
    try {
      return await localDataSource.getWishlistCount(userId);
    } catch (e) {
      throw Exception('Failed to get wishlist count: $e');
    }
  }
}
