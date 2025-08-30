import 'package:hive/hive.dart';
import '../../domain/entities/wishlist_entity.dart';
import '../models/wishlist_model.dart';

abstract class WishlistLocalDataSource {
  Future<List<WishlistEntity>> getWishlistItems(String userId);
  Future<WishlistEntity> addToWishlist(WishlistEntity movie, String userId);
  Future<void> removeFromWishlist(int movieId, String userId);
  Future<bool> isInWishlist(int movieId, String userId);
  Future<void> clearWishlist(String userId);
  Future<int> getWishlistCount(String userId);
}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  final Box<WishlistModel> wishlistBox;
  static const guestUserId = 'guest';

  WishlistLocalDataSourceImpl({required this.wishlistBox});

  String _getKey(String userId, String movieId) => '${userId}_$movieId';

  @override
  Future<List<WishlistEntity>> getWishlistItems(String userId) async {
    try {
      final actualUserId = userId.isEmpty ? guestUserId : userId;
      return wishlistBox.values
          .where((item) => item.userId == actualUserId)
          .map((model) => model.toEntity())
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch wishlist locally: $e');
    }
  }

  @override
  Future<WishlistEntity> addToWishlist(
    WishlistEntity movie,
    String userId,
  ) async {
    try {
      final actualUserId = userId.isEmpty ? guestUserId : userId;
      final key = _getKey(actualUserId, movie.id);

      if (wishlistBox.containsKey(key)) {
        return wishlistBox.get(key)!.toEntity();
      }

      final wishlistModel = WishlistModel.fromEntity(
        movie,
        userId: actualUserId,
      );
      await wishlistBox.put(key, wishlistModel);
      return wishlistModel.toEntity();
    } catch (e) {
      throw Exception('Failed to add to local wishlist: $e');
    }
  }

  @override
  Future<void> removeFromWishlist(int movieId, String userId) async {
    try {
      final actualUserId = userId.isEmpty ? guestUserId : userId;
      final key = _getKey(actualUserId, movieId.toString());
      await wishlistBox.delete(key);
    } catch (e) {
      throw Exception('Failed to remove from local wishlist: $e');
    }
  }

  @override
  Future<bool> isInWishlist(int movieId, String userId) async {
    final actualUserId = userId.isEmpty ? guestUserId : userId;
    final key = _getKey(actualUserId, movieId.toString());
    return wishlistBox.containsKey(key);
  }

  @override
  Future<void> clearWishlist(String userId) async {
    final actualUserId = userId.isEmpty ? guestUserId : userId;
    final keysToRemove = wishlistBox.keys
        .where((key) => key.toString().startsWith('${actualUserId}_'))
        .toList();
    await wishlistBox.deleteAll(keysToRemove);
  }

  @override
  Future<int> getWishlistCount(String userId) async {
    final actualUserId = userId.isEmpty ? guestUserId : userId;
    return wishlistBox.values
        .where((item) => item.userId == actualUserId)
        .length;
  }
}
