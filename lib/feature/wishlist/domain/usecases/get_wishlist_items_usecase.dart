import '../entities/wishlist_entity.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlistItems {
  final WishlistRepository repository;

  GetWishlistItems(this.repository);

  Future<List<WishlistEntity>> call({String userId = ''}) async {
    return repository.getWishlistItems(userId);
  }
}
