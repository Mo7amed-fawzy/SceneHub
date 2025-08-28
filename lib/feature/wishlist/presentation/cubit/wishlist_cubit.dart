import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/clear_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_count_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/is_in_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:bloc/bloc.dart';

import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlistItems getWishlistItemsUseCase;
  final AddToWishlist addToWishlistUseCase;
  final RemoveFromWishlist removeFromWishlistUseCase;
  final IsInWishlist isInWishlistUseCase;
  final ClearWishlist clearWishlistUseCase;
  final GetWishlistCount getWishlistCountUseCase;

  WishlistCubit({
    required this.getWishlistItemsUseCase,
    required this.addToWishlistUseCase,
    required this.removeFromWishlistUseCase,
    required this.isInWishlistUseCase,
    required this.clearWishlistUseCase,
    required this.getWishlistCountUseCase,
  }) : super(WishlistInitial());

  // Fetch all items
  Future<void> fetchWishlist({String userId = ''}) async {
    emit(WishlistLoading());
    try {
      final items = await getWishlistItemsUseCase.call(userId: userId);
      emit(WishlistLoaded(items));
    } catch (e) {
      emit(WishlistError('Failed to load wishlist: $e'));
    }
  }

  // Add item
  Future<void> addToWishlist(WishlistEntity movie, {String userId = ''}) async {
    try {
      await addToWishlistUseCase.call(movie, userId: userId);
      await fetchWishlist(userId: userId); // Update the list
      emit(WishlistOperationSuccess('Added to wishlist'));
    } catch (e) {
      emit(WishlistOperationFailure('Failed to add: $e'));
    }
  }

  // Remove item
  Future<void> removeFromWishlist(int movieId, {String userId = ''}) async {
    try {
      await removeFromWishlistUseCase.call(movieId, userId: userId);
      await fetchWishlist(userId: userId); // Update the list
      emit(WishlistOperationSuccess('Removed from wishlist'));
    } catch (e) {
      emit(WishlistOperationFailure('Failed to remove: $e'));
    }
  }

  // Check if item is in wishlist
  Future<bool> isInWishlist(int movieId, {String userId = ''}) async {
    try {
      return await isInWishlistUseCase.call(movieId, userId: userId);
    } catch (_) {
      return false;
    }
  }

  // Clear wishlist
  Future<void> clearWishlist({String userId = ''}) async {
    try {
      await clearWishlistUseCase.call(userId: userId);
      emit(WishlistLoaded([])); // Empty list after clear
      emit(WishlistOperationSuccess('Wishlist cleared'));
    } catch (e) {
      emit(WishlistOperationFailure('Failed to clear wishlist: $e'));
    }
  }

  // Get wishlist count
  Future<int> getWishlistCount({String userId = ''}) async {
    try {
      return await getWishlistCountUseCase.call(userId: userId);
    } catch (_) {
      return 0;
    }
  }
}
