import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/app_theme.dart';
import 'package:ai_movie_app/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SceneHub extends StatelessWidget {
  const SceneHub({super.key});

  @override
  Widget build(BuildContext context) {
    sl<ThemeCubit>().loadTheme();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return
        // BlocProvider(
        //   create: (context) => MoviesBloc(sl()),
        //   child:
        ValueListenableBuilder<ThemeMode>(
          valueListenable: sl<ThemeCubit>().themeModeNotifier,
          builder: (context, themeMode, _) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: goRouter,
              themeMode: themeMode,
              theme: AppTheme.lightNeoFuturisticTheme,
              darkTheme: AppTheme.darkNeoFuturisticTheme,
            );
          },
        );
      },
    );
  }
}
