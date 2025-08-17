import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/theme_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/forgot_password_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/sign_in_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/sign_up_view.dart';
import 'package:ai_movie_app/feature/episodes/presentation/screens/episode_view_screen.dart';
import 'package:ai_movie_app/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:ai_movie_app/feature/movies/presentation/screens/movies_details_screen.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/on_boarding_view.dart';
import 'package:ai_movie_app/feature/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/episodes/data/models/get_episodes_prams.dart';
import '../../feature/episodes/presentation/bloc/episode_bloc.dart';

const String toOnbourding = "/onBourding";
const String signUpPage = "/signUp";
const String signInPage = "/signIn";
const String homeView = "/HomeView";
const String forgotPassword = "/ForgotPasswordView";
const String homeNavBar = "/HomeNavBar";
const String episodeView = "/EpisodeView";

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => BlocProvider.value(
        value: sl<ThemeCubit>(),
        child: const SplashView(),
      ),
    ),
    GoRoute(
      path: toOnbourding,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<OnBoardingCubit>(),
        child: OnBourdingView(),
      ),
    ),
    GoRoute(
      path: signUpPage,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: signInPage,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
    // GoRoute(path: homeView, builder: (context, state) => const HomeView()),
    // GoRoute(
    //   path: homeNavBar,
    //   builder: (context, state) => const HomeNavBarWidget(),
    // ),
    GoRoute(
      path: forgotPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),

    GoRoute(
      path: '$homeView/:id',
      builder: (context, state) {
        final movieIdStr = state.pathParameters['id'];
        if (movieIdStr == null) return const SizedBox(); // In errorr case
        final movieId = int.tryParse(movieIdStr);
        if (movieId == null) return const SizedBox(); // In errorr case

        return BlocProvider(
          create: (context) => MoviesBloc(sl()),
          child: MoviesDetailsScreen(movieId: movieId),
        );
      },
    ),
    GoRoute(
      path: episodeView,
      builder: (context, state) {
        final params = state.extra as GetEpisodesParams?;
        if (params == null) return const SizedBox(); // In error case
        return BlocProvider(
          create: (context) => EpisodeBloc(),
          child: EpisodeViewScreen(params: params),
        );
      },
    ),
  ],
);
