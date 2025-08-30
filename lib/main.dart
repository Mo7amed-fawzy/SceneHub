import 'package:ai_movie_app/app/my_app.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:ai_movie_app/feature/ai_chat/di/ai_di.dart';
import 'package:ai_movie_app/feature/auth/di/auth_injection.dart';
import 'package:ai_movie_app/feature/home/di/home_di.dart';

import 'package:ai_movie_app/feature/movies/di/movies_di.dart';
import 'package:ai_movie_app/feature/wishlist/di/wishlist_injection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import 'feature/movies/di/movies_di.dart';
// import 'feature/wishlist/di/wishlist_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "env/.env");

  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    anonKey: EnvConfig.supabaseAnonKey,
  );
  await Hive.initFlutter();
  await initWishlistFeature();

  // Initialize service locator
  // skk.reset(); // يمسح كل اللي اتسجل قبل كده
  await initSl();
  initFeatureServiceLocator();
  // await initSplashDependencies();

  // await initOnBoardingDependencies();
  await homeInit();
  // await initSplashDependencies();
  // await initOnBoardingDependencies();
  await initMoviesDependencies();
  await initAuthDependencies();

  runApp(const SceneHub());
}
