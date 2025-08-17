import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/theme_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/forgot_password_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/sign_in_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/sign_up_view.dart';

import 'package:ai_movie_app/feature/episodes/presentation/screens/episode_view_screen.dart';

import 'package:ai_movie_app/feature/home/presentation/views/bottom_nav_bar.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/animated_placeholder_page.dart';

import 'package:ai_movie_app/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:ai_movie_app/feature/movies/presentation/screens/movies_details_screen.dart';
import 'package:ai_movie_app/feature/home/presentation/views/home_view.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/on_boarding_view.dart';
import 'package:ai_movie_app/feature/splash/presentation/views/splash_view.dart';

import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';

import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/views/wishlist_view.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../feature/episodes/data/models/get_episodes_prams.dart';
import '../../feature/episodes/presentation/bloc/episode_bloc.dart';
import '../../feature/tv_series/presentation/screens/tv_series_details_screen.dart';

const String toOnbourding = "/onBourding";
const String signUpPage = "/signUp";
const String signInPage = "/signIn";
const String homeView = "/HomeView";
const String forgotPassword = "/ForgotPasswordView";
const String homeNavBar = "/HomeNavBar";

const String episodeView = "/EpisodeView";
const String tvSeriesDetails = "/TvSeriesDetails";

const String searchView = "/search";
const String wishlistView = "/wishlist";
const String search = "/search";
const String profile = "/profile";
const String settings = "/settings";


final GoRouter goRouter = GoRouter(
  routes: [
    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => BlocProvider.value(
    //     value: sl<ThemeCubit>(),
    //     child: const SplashView(),
    //   ),
    // ),
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
        create: (context) => sl<AuthCubit>(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: signInPage,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const SignInView(),
      ),
    ),

    GoRoute(
      path: forgotPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const ForgotPasswordView(),
      ),
    ),

    // GoRoute(path: homeView, builder: (context, state) => const HomeView()),
    GoRoute(
      path: '$homeView/:id',
      builder: (context, state) {
        final movieIdStr = state.pathParameters['id'];
        if (movieIdStr == null) return const SizedBox();
        final movieId = int.tryParse(movieIdStr);
        if (movieId == null) return const SizedBox();

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
          create: (context) => EpisodeBloc(sl()),
          child: EpisodeViewScreen(params: params),
        );
      },
    ),
    GoRoute(
      path: '$tvSeriesDetails/:tvSeriesId',
      builder: (context, state) {
        final tvSeriesIdStr = state.pathParameters['tvSeriesId'];
        if (tvSeriesIdStr == null) return const SizedBox(); // In error case
        final tvSeriesId = int.tryParse(tvSeriesIdStr);
        if (tvSeriesId == null) return const SizedBox(); // In error case
        return BlocProvider(
          create: (context) => TvSeriesBloc(sl(), sl()),
          child: TvSeriesDetailsScreen(tvSeriesId: tvSeriesId),
        );
      },

    ShellRoute(
      builder: (context, state, child) {
        return HomeNavBarShell(child: child);
      },
      routes: [
        GoRoute(path: homeView, builder: (context, state) => const HomeView()),

        GoRoute(
          path: wishlistView,
          builder: (context, state) => BlocProvider(
            create: (context) => GetIt.instance<WishlistCubit>(),
            child: const WishlistView(userId: 'current-user-id'),
          ),
        ),
        GoRoute(
          path: search,
          builder: (context, state) =>
              const AnimatedPlaceholderPage(title: "Search"),
        ),
        GoRoute(
          path: profile,
          builder: (context, state) =>
              const AnimatedPlaceholderPage(title: "Profile"),
        ),
        GoRoute(
          path: settings,
          builder: (context, state) =>
              const AnimatedPlaceholderPage(title: "Settings"),
        ),
      ],

    ),
  ],
);
