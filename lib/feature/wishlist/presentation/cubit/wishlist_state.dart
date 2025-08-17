import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<WishlistItem> wishlistItems;
  final int count;

  WishlistLoaded({required this.wishlistItems, required this.count});
}

class WishlistEmpty extends WishlistState {}

class WishlistError extends WishlistState {
  final String message;

  WishlistError({required this.message});
}

class AddToWishlistLoading extends WishlistState {}

class AddToWishlistSuccess extends WishlistState {
  final WishlistItem wishlistItem;

  AddToWishlistSuccess({required this.wishlistItem});
}

class AddToWishlistError extends WishlistState {
  final String message;

  AddToWishlistError({required this.message});
}

class RemoveFromWishlistLoading extends WishlistState {}

class RemoveFromWishlistSuccess extends WishlistState {
  final String movieId;

  RemoveFromWishlistSuccess({required this.movieId});
}

class RemoveFromWishlistError extends WishlistState {
  final String message;

  RemoveFromWishlistError({required this.message});
}

class ClearWishlistLoading extends WishlistState {}

class ClearWishlistSuccess extends WishlistState {}

class ClearWishlistError extends WishlistState {
  final String message;

  ClearWishlistError({required this.message});
}

class CheckWishlistStatusLoading extends WishlistState {}

class CheckWishlistStatusSuccess extends WishlistState {
  final bool isInWishlist;

  CheckWishlistStatusSuccess({required this.isInWishlist});
}

class CheckWishlistStatusError extends WishlistState {
  final String message;

  CheckWishlistStatusError({required this.message});
}
