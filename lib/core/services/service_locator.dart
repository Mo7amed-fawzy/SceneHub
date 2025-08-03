import 'package:get_it/get_it.dart';

import '../database/cache/app_shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> initSl() async {
  // Register your services, repositories, and other dependencies here
  // Example:
  // sl.registerLazySingleton<Auth>(() => SomeServiceImpl());
  // sl.registerFactory<SomeRepository>(() => SomeRepositoryImpl());

  // Initialize and register AppPreferences as a singleton
  final appPreferences = AppPreferences();
  await appPreferences.init();
  sl.registerSingleton(appPreferences);
}
