import '../repositories/wishlist_repository.dart';

class IsInWishlist {
  final WishlistRepository repository;

  IsInWishlist(this.repository);

  Future<bool> call(int movieId, {String userId = ''}) async {
    return repository.isInWishlist(movieId, userId);
  }
}
