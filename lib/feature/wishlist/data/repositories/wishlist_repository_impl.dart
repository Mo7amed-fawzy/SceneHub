import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/errors/exceptions.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/data/datasources/wishlist_local_data_source.dart';
import 'package:ai_movie_app/feature/wishlist/data/datasources/wishlist_remote_data_source.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:dartz/dartz.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistRemoteDataSource? remoteDataSource;
  final WishlistLocalDataSource localDataSource;

  WishlistRepositoryImpl({
    this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  AsyncListOfDataResponse<WishlistItem> getWishlistItems(String userId) async {
    try {
      // Try remote first if available, fallback to local
      if (remoteDataSource != null) {
        final remoteItems = await remoteDataSource!.getWishlistItems(userId);
        return Right(remoteItems);
      } else {
        // Use local data only
        final localItems = await localDataSource.getWishlistItems(userId);
        return Right(localItems);
      }
    } catch (e) {
      try {
        // Fallback to local data
        final localItems = await localDataSource.getWishlistItems(userId);
        return Right(localItems);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  AsyncSingleDataResponse<WishlistItem> addToWishlist(
    MovieModel movie,
    String userId,
  ) async {
    try {
      // Add to local first
      final localItem = await localDataSource.addToWishlist(movie, userId);

      // Try to add to remote if available
      if (remoteDataSource != null) {
        try {
          final remoteItem = await remoteDataSource!.addToWishlist(
            movie,
            userId,
          );
          return Right(remoteItem);
        } catch (e) {
          // Remote failed, but local succeeded
          return Right(localItem);
        }
      } else {
        return Right(localItem);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  AsyncVoidResponse removeFromWishlist(String movieId, String userId) async {
    try {
      // Remove from local first
      await localDataSource.removeFromWishlist(movieId, userId);

      // Try to remove from remote if available
      if (remoteDataSource != null) {
        try {
          await remoteDataSource!.removeFromWishlist(movieId, userId);
        } catch (e) {
          // Remote failed, but local succeeded
          print('Remote removal failed: $e');
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  AsyncBooleanResponse isInWishlist(String movieId, String userId) async {
    try {
      // Check local first
      final isInLocal = await localDataSource.isInWishlist(movieId, userId);

      // If remote is available, try to sync
      if (remoteDataSource != null) {
        try {
          final isInRemote = await remoteDataSource!.isInWishlist(
            movieId,
            userId,
          );
          return Right(isInRemote);
        } catch (e) {
          // Remote failed, use local result
          return Right(isInLocal);
        }
      } else {
        return Right(isInLocal);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  AsyncVoidResponse clearWishlist(String userId) async {
    try {
      // Clear local first
      await localDataSource.clearWishlist(userId);

      // Try to clear remote if available
      if (remoteDataSource != null) {
        try {
          await remoteDataSource!.clearWishlist(userId);
        } catch (e) {
          // Remote failed, but local succeeded
          print('Remote clear failed: $e');
        }
      }

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  AsyncSingleDataResponse<int> getWishlistCount(String userId) async {
    try {
      // Get count from local
      final localCount = await localDataSource.getWishlistCount(userId);

      // If remote is available, try to get remote count
      if (remoteDataSource != null) {
        try {
          final remoteCount = await remoteDataSource!.getWishlistCount(userId);
          return Right(remoteCount);
        } catch (e) {
          // Remote failed, use local count
          return Right(localCount);
        }
      } else {
        return Right(localCount);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
