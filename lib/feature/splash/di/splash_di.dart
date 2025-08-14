import 'package:ai_movie_app/feature/splash/domain/repositories/splash_auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/feature/splash/data/repositories/supabase_auth_repository.dart';
import 'package:ai_movie_app/feature/splash/domain/use_case/decide_start_destination_usecase.dart';

Future<void> initSplashDependencies(GetIt sl) async {
  sl.registerLazySingleton<SplashAuthRepository>(
    () => SupabaseAuthRepository(),
  );
  sl.registerLazySingleton<DecideStartDestinationUseCase>(
    () => DecideStartDestinationUseCase(
      appPreferences: sl(),
      authRepository: sl(),
    ),
  );
}
