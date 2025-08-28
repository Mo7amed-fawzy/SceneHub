import 'package:ai_movie_app/core/constants/cache_keys.dart';
import 'package:ai_movie_app/feature/wishlist/data/models/wishlist_model.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/clear_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_count_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/is_in_wishlist_usecase.dart';
import 'package:ai_movie_app/feature/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/feature/wishlist/data/datasources/wishlist_local_data_source.dart';
import 'package:ai_movie_app/feature/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:ai_movie_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:hive_flutter/adapters.dart';

final wishlist = GetIt.instance;

Future<void> initWishlistFeature() async {
  Hive.registerAdapter(WishlistModelAdapter()); // تسجيل ال adapter

  final wishlistBox = await Hive.openBox<WishlistModel>(CacheKeys.wishlist);

  // Cubit
  wishlist.registerFactory(
    () => WishlistCubit(
      getWishlistItemsUseCase: wishlist(),
      addToWishlistUseCase: wishlist(),
      removeFromWishlistUseCase: wishlist(),
      isInWishlistUseCase: wishlist(),
      clearWishlistUseCase: wishlist(),
      getWishlistCountUseCase: wishlist(),
    ),
  );

  // UseCases
  wishlist.registerLazySingleton(() => GetWishlistItems(wishlist()));
  wishlist.registerLazySingleton(() => AddToWishlist(wishlist()));
  wishlist.registerLazySingleton(() => RemoveFromWishlist(wishlist()));
  wishlist.registerLazySingleton(() => IsInWishlist(wishlist()));
  wishlist.registerLazySingleton(() => ClearWishlist(wishlist()));
  wishlist.registerLazySingleton(() => GetWishlistCount(wishlist()));

  // Repository
  wishlist.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(
      localDataSource: wishlist(),
      // remoteDataSource: wishlist(),
    ),
  );

  // DataSources
  wishlist.registerLazySingleton<WishlistLocalDataSource>(
    () => WishlistLocalDataSourceImpl(wishlistBox: wishlistBox),
  );
  // wishlist.registerLazySingleton<WishlistRemoteDataSource>(
  //   () => WishlistRemoteDataSourceImpl(dio: wishlist()),
  // );

  // External
  // wishlist.registerLazySingleton(() => Dio());
  // Hive box registration مثال لو محتاج
  // final wishlistBox = await Hive.openBox<WishlistModel>('wishlist');
  // sl.registerLazySingleton(() => wishlistBox);
}
