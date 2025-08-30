// import 'package:ai_movie_app/core/utils/api_keys.dart';
// import 'package:dio/dio.dart';
// import '../models/wishlist_model.dart';
// import 'package:ai_movie_app/core/constants/endpoint_constants.dart';

// abstract class WishlistRemoteDataSource {
//   Future<List<WishlistModel>> getWishlistItems(String userId);
//   Future<WishlistModel> addToWishlist(WishlistModel movie, String userId);
//   Future<void> removeFromWishlist(int movieId, String userId);
//   Future<bool> isInWishlist(int movieId, String userId);
//   Future<void> clearWishlist(String userId);
//   Future<int> getWishlistCount(String userId);
// }

// class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
//   final Dio dio;
//   static const guestUserId = 'guest';

//   WishlistRemoteDataSourceImpl({required this.dio});

//   String _getUserId(String userId) => userId.isEmpty ? guestUserId : userId;

//   Map<String, dynamic> _withApiKey([Map<String, dynamic>? params]) {
//     return {'api_key': EnvConfig.tmdbApiKey, ...?params};
//   }

//   @override
//   Future<List<WishlistModel>> getWishlistItems(String userId) async {
//     try {
//       final response = await dio.get(
//         '${EndpointConstants.baseUrl}/wishlist',
//         queryParameters: _withApiKey({'user_id': _getUserId(userId)}),
//       );
//       final data = response.data as List?;
//       if (data == null) return [];
//       return data.map((item) => WishlistModel.fromJson(item)).toList();
//     } catch (e) {
//       throw Exception('Failed to get wishlist items: $e');
//     }
//   }

//   @override
//   Future<WishlistModel> addToWishlist(
//     WishlistModel movie,
//     String userId,
//   ) async {
//     try {
//       final wishlistItem = WishlistModel(
//         id: movie.id,
//         name: movie.name,
//         posterPath: movie.posterPath,
//         userId: _getUserId(userId),
//         addedAt: DateTime.now(),
//       );
//       await dio.post(
//         '${EndpointConstants.baseUrl}/wishlist',
//         data: wishlistItem.toJson(),
//         queryParameters: _withApiKey(),
//       );
//       return wishlistItem;
//     } catch (e) {
//       throw Exception('Failed to add movie to wishlist: $e');
//     }
//   }

//   @override
//   Future<void> removeFromWishlist(int movieId, String userId) async {
//     try {
//       await dio.delete(
//         '${EndpointConstants.baseUrl}/wishlist/$movieId',
//         queryParameters: _withApiKey({'user_id': _getUserId(userId)}),
//       );
//     } catch (e) {
//       throw Exception('Failed to remove movie from wishlist: $e');
//     }
//   }

//   @override
//   Future<bool> isInWishlist(int movieId, String userId) async {
//     try {
//       final response = await dio.get(
//         '${EndpointConstants.baseUrl}/wishlist/$movieId',
//         queryParameters: _withApiKey({'user_id': _getUserId(userId)}),
//       );
//       return response.data != null;
//     } catch (_) {
//       return false;
//     }
//   }

//   @override
//   Future<void> clearWishlist(String userId) async {
//     try {
//       await dio.delete(
//         '${EndpointConstants.baseUrl}/wishlist',
//         queryParameters: _withApiKey({'user_id': _getUserId(userId)}),
//       );
//     } catch (e) {
//       throw Exception('Failed to clear wishlist: $e');
//     }
//   }

//   @override
//   Future<int> getWishlistCount(String userId) async {
//     try {
//       final response = await dio.get(
//         '${EndpointConstants.baseUrl}/wishlist/count',
//         queryParameters: _withApiKey({'user_id': _getUserId(userId)}),
//       );
//       return response.data['count'] as int;
//     } catch (e) {
//       throw Exception('Failed to get wishlist count: $e');
//     }
//   }
// }
