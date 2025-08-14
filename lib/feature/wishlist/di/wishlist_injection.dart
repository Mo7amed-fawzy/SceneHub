import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/feature/wishlist/data/datasources/wishlist_local_data_source.dart';
import 'package:ai_movie_app/feature/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/clear_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_count_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/is_in_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';

final getIt = GetIt.instance;

Future<void> initWishlistDependencies() async {
  // Data Sources - Only local for now
  getIt.registerLazySingleton<WishlistLocalDataSource>(
    () =>
        WishlistLocalDataSourceImpl(sharedPreferences: getIt<AppPreferences>()),
  );

  // Repository - Using only local data source
  getIt.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(
      remoteDataSource: null, // No remote data source for now
      localDataSource: getIt<WishlistLocalDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton(
    () => GetWishlistItemsUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton(
    () => AddToWishlistUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton(
    () => RemoveFromWishlistUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton(
    () => ClearWishlistUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton(
    () => IsInWishlistUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetWishlistCountUseCase(getIt<WishlistRepository>()),
  );

  // Cubit
  getIt.registerFactory(
    () => WishlistCubit(
      getWishlistItemsUseCase: getIt<GetWishlistItemsUseCase>(),
      addToWishlistUseCase: getIt<AddToWishlistUseCase>(),
      removeFromWishlistUseCase: getIt<RemoveFromWishlistUseCase>(),
      clearWishlistUseCase: getIt<ClearWishlistUseCase>(),
      isInWishlistUseCase: getIt<IsInWishlistUseCase>(),
      getWishlistCountUseCase: getIt<GetWishlistCountUseCase>(),
    ),
  );
}
