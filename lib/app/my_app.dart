import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SceneHub extends StatelessWidget {
  const SceneHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return
        // BlocProvider(
        //   create: (context) => MoviesBloc(sl()),
        //   child:
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
        );
        // );
      },
    );
  }
}
