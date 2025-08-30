import '../repositories/wishlist_repository.dart';

class GetWishlistCount {
  final WishlistRepository repository;

  GetWishlistCount(this.repository);

  Future<int> call({String userId = ''}) async {
    return repository.getWishlistCount(userId);
  }
}
