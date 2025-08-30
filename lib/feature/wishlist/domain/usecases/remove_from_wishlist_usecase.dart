import '../repositories/wishlist_repository.dart';

class RemoveFromWishlist {
  final WishlistRepository repository;

  RemoveFromWishlist(this.repository);

  Future<void> call(int movieId, {String userId = ''}) async {
    return repository.removeFromWishlist(movieId, userId);
  }
}
