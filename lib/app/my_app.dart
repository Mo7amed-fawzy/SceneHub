import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/screens/tv_series_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SceneHub extends StatelessWidget {
  const SceneHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => TvSeriesBloc(sl(), sl(), sl()),
            child: const TvSeriesDetailsScreen(),
          );
        },
      ),
    );
  }
}
