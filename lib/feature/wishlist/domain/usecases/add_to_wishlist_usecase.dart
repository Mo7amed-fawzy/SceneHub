import '../entities/wishlist_entity.dart';
import '../repositories/wishlist_repository.dart';

class AddToWishlist {
  final WishlistRepository repository;

  AddToWishlist(this.repository);

  Future<WishlistEntity> call(
    WishlistEntity movie, {
    String userId = '',
  }) async {
    return repository.addToWishlist(movie, userId);
  }
}
