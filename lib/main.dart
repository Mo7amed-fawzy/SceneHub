import 'package:ai_movie_app/app/my_app.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:ai_movie_app/feature/auth/di/auth_injection.dart';
import 'package:ai_movie_app/feature/on_bourding/di/on_bourding_di.dart';
import 'package:ai_movie_app/feature/splash/di/splash_di.dart';
import 'package:ai_movie_app/feature/wishlist/di/wishlist_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "env/.env");

  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    anonKey: EnvConfig.supabaseAnonKey,
  );

  // Initialize service locator

  await initSl();
  // await initSplashDependencies();

  // await initOnBoardingDependencies();
  await initAuthDependencies();
  await initWishlistDependencies();

  runApp(const SceneHub());
}
