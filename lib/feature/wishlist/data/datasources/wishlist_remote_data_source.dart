import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/data/models/wishlist_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class WishlistRemoteDataSource {
  Future<List<WishlistItemModel>> getWishlistItems(String userId);
  Future<WishlistItemModel> addToWishlist(MovieModel movie, String userId);
  Future<void> removeFromWishlist(String movieId, String userId);
  Future<bool> isInWishlist(String movieId, String userId);
  Future<void> clearWishlist(String userId);
  Future<int> getWishlistCount(String userId);
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  final SupabaseClient supabaseClient;

  WishlistRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<WishlistItemModel>> getWishlistItems(String userId) async {
    try {
      final response = await supabaseClient
          .from('wishlist')
          .select('*')
          .eq('user_id', userId)
          .order('added_at', ascending: false);

      return (response as List)
          .map((item) => WishlistItemModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Failed to get wishlist items: $e');
    }
  }

  @override
  Future<WishlistItemModel> addToWishlist(
    MovieModel movie,
    String userId,
  ) async {
    try {
      final wishlistItem = WishlistItemModel(
        id: '${userId}_${movie.id}',
        movie: movie,
        addedAt: DateTime.now(),
        userId: userId,
      );

      await supabaseClient.from('wishlist').insert(wishlistItem.toJson());

      return wishlistItem;
    } catch (e) {
      throw Exception('Failed to add movie to wishlist: $e');
    }
  }

  @override
  Future<void> removeFromWishlist(String movieId, String userId) async {
    try {
      await supabaseClient
          .from('wishlist')
          .delete()
          .eq('user_id', userId)
          .eq('movie_id', movieId);
    } catch (e) {
      throw Exception('Failed to remove movie from wishlist: $e');
    }
  }

  @override
  Future<bool> isInWishlist(String movieId, String userId) async {
    try {
      final response = await supabaseClient
          .from('wishlist')
          .select('id')
          .eq('user_id', userId)
          .eq('movie_id', movieId)
          .single();

      return response != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearWishlist(String userId) async {
    try {
      await supabaseClient.from('wishlist').delete().eq('user_id', userId);
    } catch (e) {
      throw Exception('Failed to clear wishlist: $e');
    }
  }

  @override
  Future<int> getWishlistCount(String userId) async {
    try {
      final response = await supabaseClient
          .from('wishlist')
          .select('id')
          .eq('user_id', userId);

      return (response as List).length;
    } catch (e) {
      throw Exception('Failed to get wishlist count: $e');
    }
  }
}
