import '../repositories/wishlist_repository.dart';

class ClearWishlist {
  final WishlistRepository repository;

  ClearWishlist(this.repository);

  Future<void> call({String userId = ''}) async {
    return repository.clearWishlist(userId);
  }
}
