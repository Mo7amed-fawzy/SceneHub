import '../../domain/entities/wishlist_entity.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<WishlistEntity> items;

  WishlistLoaded(this.items);
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError(this.message);
}

class WishlistOperationSuccess extends WishlistState {
  final String message;

  WishlistOperationSuccess(this.message);
}

class WishlistOperationFailure extends WishlistState {
  final String message;

  WishlistOperationFailure(this.message);
}
