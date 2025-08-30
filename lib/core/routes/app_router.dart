import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/theme_cubit.dart';
import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scenebot_cubit.dart';
import 'package:ai_movie_app/feature/ai_chat/Presentation/scene_bot_chat_page.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/forgot_password_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/sign_in_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/views/sign_up_view.dart';
import 'package:ai_movie_app/feature/episodes/data/models/get_episodes_prams.dart';
import 'package:ai_movie_app/feature/episodes/presentation/bloc/episode_bloc.dart';
import 'package:ai_movie_app/feature/episodes/presentation/screens/episode_view_screen.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/home_media_bloc.dart';
import 'package:ai_movie_app/feature/home/presentation/views/bottom_nav_bar.dart';
import 'package:ai_movie_app/feature/home/presentation/views/home_view.dart';
import 'package:ai_movie_app/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:ai_movie_app/feature/movies/presentation/screens/movies_details_screen.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/on_boarding_view.dart';
import 'package:ai_movie_app/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:ai_movie_app/feature/profile/presentation/screen/profile_view.dart';
import 'package:ai_movie_app/feature/profile/presentation/screen/settings_view.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/screens/tv_series_details_screen.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/views/wishlist_view.dart';
import 'package:ai_movie_app/feature/wishlist/di/wishlist_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class RouterPath {
  static const String toOnbourding = "/onBourding";
  static const String signUpPage = "/signUp";
  static const String signInPage = "/signIn";
  static const String homeView = "/HomeView";
  static const String forgotPassword = "/ForgotPasswordView";
  static const String homeNavBar = "/HomeNavBar";
  static const String searchView = "/search";
  static const String wishlistView = "/wishlist";
  static const String search = "/search";
  static const String profile = "/profile";
  static const String settings = "/settings";
  static const String episodeView = "/episodeView";
  static const String tvSeriesDetails = "/tvSeriesDetails";
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouterPath.toOnbourding,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<OnBoardingCubit>(),
        child: OnBourdingView(),
      ),
    ),
    GoRoute(
      path: RouterPath.signUpPage,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: RouterPath.signInPage,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: RouterPath.forgotPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
  path: '/movie/:id',
  builder: (context, state) {
    final movieIdStr = state.pathParameters['id'];
    if (movieIdStr == null) return const SizedBox();
    final movieId = int.tryParse(movieIdStr);
    if (movieId == null) return const SizedBox();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesBloc(sl())),
        BlocProvider(
          create: (context) => sl<WishlistCubit>()..fetchWishlist(userId: '123'), // fetch existing wishlist
        ),
      ],
      child: MoviesDetailsScreen(movieId: movieId),
    );
  },
),
GoRoute(
  path: RouterPath.episodeView,
  builder: (context, state) {
    final params = state.extra as GetEpisodesParams?;
    if (params == null) return const SizedBox();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EpisodeBloc(sl())),
        BlocProvider(
          create: (context) => sl<WishlistCubit>()..fetchWishlist(userId: '123'),
        ),
      ],
      child: EpisodeViewScreen(params: params),
    );
  },
),
GoRoute(
  path: '${RouterPath.tvSeriesDetails}/:tvSeriesId',
  builder: (context, state) {
    final tvSeriesIdStr = state.pathParameters['tvSeriesId'];
    if (tvSeriesIdStr == null) return const SizedBox();
    final tvSeriesId = int.tryParse(tvSeriesIdStr);
    if (tvSeriesId == null) return const SizedBox();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TvSeriesBloc(sl(), sl())),
        BlocProvider(
          create: (context) => sl<WishlistCubit>()..fetchWishlist(userId: '123'),
        ),
      ],
      child: TvSeriesDetailsScreen(tvSeriesId: tvSeriesId),
    );
  },
),
ShellRoute(
  builder: (context, state, child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
        ),
        BlocProvider(
          create: (context) => HomeMediaBloc(
            getDetailsUseCase: sl(),
            getNowPlayingUseCase: sl(),
            getMixedNowPlayingUseCase: sl(),
          )..add(GetMixedNowPlayingEvent()),
        ),
        BlocProvider(
          create: (context) => sl<WishlistCubit>()..fetchWishlist(userId: '123'),
        ),
        BlocProvider(
          create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
        ),
      ],
      child: HomeNavBarShell(child: child),
    );
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeView()),
    GoRoute(
      path: RouterPath.wishlistView,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<WishlistCubit>()..fetchWishlist(userId: '123'),
        child: const WishlistView(),
      ),
    ),
    GoRoute(
      path: RouterPath.search,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<ScenebotCubit>(),
        child: const MovieSuggestionScreen(),
      ),
    ),
    GoRoute(
      path: RouterPath.profile,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<ThemeCubit>(),
        child: const ProfilePage(),
      ),
    ),
    GoRoute(
      path: RouterPath.settings,
      builder: (context, state) => const SettingsView(),
    ),
  ],
),

