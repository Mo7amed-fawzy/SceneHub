import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_movie_app/core/functions/print_statement.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/clear_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_count_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/is_in_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_event.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_state.dart';

class WishlistCubit extends Bloc<WishlistEvent, WishlistState> {
  final GetWishlistItemsUseCase getWishlistItemsUseCase;
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;
  final ClearWishlistUseCase clearWishlistUseCase;
  final IsInWishlistUseCase isInWishlistUseCase;
  final GetWishlistCountUseCase getWishlistCountUseCase;

  WishlistCubit({
    required this.getWishlistItemsUseCase,
    required this.addToWishlistUseCase,
    required this.removeFromWishlistUseCase,
    required this.clearWishlistUseCase,
    required this.isInWishlistUseCase,
    required this.getWishlistCountUseCase,
  }) : super(WishlistInitial()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
    on<ClearWishlist>(_onClearWishlist);
    on<CheckWishlistStatus>(_onCheckWishlistStatus);
    on<RefreshWishlist>(_onRefreshWishlist);
  }

  Future<void> _onLoadWishlist(
    LoadWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      emit(WishlistLoading());

      final result = await getWishlistItemsUseCase(event.userId);

      result.fold(
        (failure) {
          emit(WishlistError(message: failure.message));
        },
        (wishlistItems) {
          if (wishlistItems.isEmpty) {
            emit(WishlistEmpty());
          } else {
            emit(
              WishlistLoaded(
                wishlistItems: wishlistItems,
                count: wishlistItems.length,
              ),
            );
          }
        },
      );
    } catch (e) {
      printHere('Error loading wishlist: $e');
      emit(WishlistError(message: e.toString()));
    }
  }

  Future<void> _onAddToWishlist(
    AddToWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      emit(AddToWishlistLoading());

      final result = await addToWishlistUseCase(event.movie, event.userId);

      result.fold(
        (failure) {
          emit(AddToWishlistError(message: failure.message));
        },
        (wishlistItem) {
          emit(AddToWishlistSuccess(wishlistItem: wishlistItem));
          // Refresh the wishlist after adding
          add(LoadWishlist(userId: event.userId));
        },
      );
    } catch (e) {
      printHere('Error adding to wishlist: $e');
      emit(AddToWishlistError(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromWishlist(
    RemoveFromWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      emit(RemoveFromWishlistLoading());

      final result = await removeFromWishlistUseCase(
        event.movieId,
        event.userId,
      );

      result.fold(
        (failure) {
          emit(RemoveFromWishlistError(message: failure.message));
        },
        (_) {
          emit(RemoveFromWishlistSuccess(movieId: event.movieId));
          // Refresh the wishlist after removing
          add(LoadWishlist(userId: event.userId));
        },
      );
    } catch (e) {
      printHere('Error removing from wishlist: $e');
      emit(RemoveFromWishlistError(message: e.toString()));
    }
  }

  Future<void> _onClearWishlist(
    ClearWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      emit(ClearWishlistLoading());

      final result = await clearWishlistUseCase(event.userId);

      result.fold(
        (failure) {
          emit(ClearWishlistError(message: failure.message));
        },
        (_) {
          emit(ClearWishlistSuccess());
          // Refresh the wishlist after clearing
          add(LoadWishlist(userId: event.userId));
        },
      );
    } catch (e) {
      printHere('Error clearing wishlist: $e');
      emit(ClearWishlistError(message: e.toString()));
    }
  }

  Future<void> _onCheckWishlistStatus(
    CheckWishlistStatus event,
    Emitter<WishlistState> emit,
  ) async {
    try {
      emit(CheckWishlistStatusLoading());

      final result = await isInWishlistUseCase(event.movieId, event.userId);

      result.fold(
        (failure) {
          emit(CheckWishlistStatusError(message: failure.message));
        },
        (isInWishlist) {
          emit(CheckWishlistStatusSuccess(isInWishlist: isInWishlist));
        },
      );
    } catch (e) {
      printHere('Error checking wishlist status: $e');
      emit(CheckWishlistStatusError(message: e.toString()));
    }
  }

  Future<void> _onRefreshWishlist(
    RefreshWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    add(LoadWishlist(userId: event.userId));
  }
}
