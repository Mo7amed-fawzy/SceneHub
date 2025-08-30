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
      emit(WishlistLoaded(List.from(items))); // clone للقائمة
    } catch (e) {
      emit(WishlistError('Failed to load wishlist: $e'));
    }
  }

  // Toggle item in wishlist (زرار ينور فورًا)
  Future<void> toggleWishlist(
    WishlistEntity movie, {
    String userId = '',
  }) async {
    if (state is WishlistLoaded) {
      final currentItems = List<WishlistEntity>.from(
        (state as WishlistLoaded).items,
      );

      final exists = currentItems.any((element) => element.id == movie.id);

      if (exists) {
        // حذف من Hive + القائمة المحلية
        await removeFromWishlistUseCase.call(
          int.parse(movie.id),
          userId: userId,
        );
        currentItems.removeWhere((element) => element.id == movie.id);
      } else {
        // إضافة إلى Hive + القائمة المحلية
        await addToWishlistUseCase.call(movie, userId: userId);
        currentItems.add(movie);
      }

      emit(WishlistLoaded([...currentItems])); // تحديث UI فورًا
    } else {
      await fetchWishlist(userId: userId);
    }
  }

  // Remove item
  Future<void> removeFromWishlist(int movieId, {String userId = ''}) async {
    try {
      await removeFromWishlistUseCase.call(movieId, userId: userId);
      final items = await getWishlistItemsUseCase.call(userId: userId);
      emit(WishlistLoaded([...items]));
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
