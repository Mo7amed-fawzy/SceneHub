import 'package:ai_movie_app/app/my_app.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Supabase Initialization
  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    anonKey: EnvConfig.supabaseAnonKey,
  );
  await initSl();
  runApp(const SceneHub());
}
