import 'package:ai_movie_app/core/models/movie_model.dart';

abstract class WishlistEvent {}

class LoadWishlist extends WishlistEvent {
  final String userId;

  LoadWishlist({required this.userId});
}

class AddToWishlist extends WishlistEvent {
  final MovieModel movie;
  final String userId;

  AddToWishlist({required this.movie, required this.userId});
}

class RemoveFromWishlist extends WishlistEvent {
  final String movieId;
  final String userId;

  RemoveFromWishlist({required this.movieId, required this.userId});
}

class ClearWishlist extends WishlistEvent {
  final String userId;

  ClearWishlist({required this.userId});
}

class CheckWishlistStatus extends WishlistEvent {
  final String movieId;
  final String userId;

  CheckWishlistStatus({required this.movieId, required this.userId});
}

class RefreshWishlist extends WishlistEvent {
  final String userId;

  RefreshWishlist({required this.userId});
}
