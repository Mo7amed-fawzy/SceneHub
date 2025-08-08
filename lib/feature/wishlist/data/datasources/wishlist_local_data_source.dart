import 'dart:convert';
import 'package:ai_movie_app/core/constants/cache_keys.dart';
import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/data/models/wishlist_item_model.dart';

abstract class WishlistLocalDataSource {
  Future<List<WishlistItemModel>> getWishlistItems(String userId);
  Future<WishlistItemModel> addToWishlist(MovieModel movie, String userId);
  Future<void> removeFromWishlist(String movieId, String userId);
  Future<bool> isInWishlist(String movieId, String userId);
  Future<void> clearWishlist(String userId);
  Future<int> getWishlistCount(String userId);
}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  final AppPreferences sharedPreferences;

  WishlistLocalDataSourceImpl({required this.sharedPreferences});

  String _getWishlistKey(String userId) => '${CacheKeys.wishlist}_$userId';

  @override
  Future<List<WishlistItemModel>> getWishlistItems(String userId) async {
    try {
      final wishlistJson = sharedPreferences.getData(_getWishlistKey(userId));
      if (wishlistJson == null || wishlistJson.isEmpty) {
        return [];
      }

      final List<dynamic> wishlistData = json.decode(wishlistJson);
      return wishlistData
          .map((item) => WishlistItemModel.fromJson(item))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<WishlistItemModel> addToWishlist(
    MovieModel movie,
    String userId,
  ) async {
    try {
      final wishlistItems = await getWishlistItems(userId);

      // Check if movie already exists
      final existingIndex = wishlistItems.indexWhere(
        (item) => item.movie.id == movie.id,
      );
      if (existingIndex != -1) {
        return wishlistItems[existingIndex];
      }

      final wishlistItem = WishlistItemModel(
        id: '${userId}_${movie.id}',
        movie: movie,
        addedAt: DateTime.now(),
        userId: userId,
      );

      wishlistItems.add(wishlistItem);
      await _saveWishlistItems(wishlistItems, userId);

      return wishlistItem;
    } catch (e) {
      throw Exception('Failed to add movie to wishlist: $e');
    }
  }

  @override
  Future<void> removeFromWishlist(String movieId, String userId) async {
    try {
      final wishlistItems = await getWishlistItems(userId);
      wishlistItems.removeWhere((item) => item.movie.id == movieId);
      await _saveWishlistItems(wishlistItems, userId);
    } catch (e) {
      throw Exception('Failed to remove movie from wishlist: $e');
    }
  }

  @override
  Future<bool> isInWishlist(String movieId, String userId) async {
    try {
      final wishlistItems = await getWishlistItems(userId);
      return wishlistItems.any((item) => item.movie.id == movieId);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearWishlist(String userId) async {
    try {
      await sharedPreferences.setData(_getWishlistKey(userId), json.encode([]));
    } catch (e) {
      throw Exception('Failed to clear wishlist: $e');
    }
  }

  @override
  Future<int> getWishlistCount(String userId) async {
    try {
      final wishlistItems = await getWishlistItems(userId);
      return wishlistItems.length;
    } catch (e) {
      return 0;
    }
  }

  Future<void> _saveWishlistItems(
    List<WishlistItemModel> items,
    String userId,
  ) async {
    final wishlistJson = json.encode(
      items.map((item) => item.toJson()).toList(),
    );
    await sharedPreferences.setData(_getWishlistKey(userId), wishlistJson);
  }
}
