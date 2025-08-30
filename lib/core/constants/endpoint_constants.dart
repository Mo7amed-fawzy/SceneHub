class EndpointConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  // static const String tvSeriesDetails = 'tv/';
  // static const String movieDetails = 'movie/';
  static const String movieCast = '/credits';
  static const String tvSeriesSeason = '/season/';
  static const String tvSeriesEpisode = '/episode/';
  static const String tvSeriesCast = '/aggregate_credits';
  // Add your endpoints here

  // static const String baseUrl1 = 'https://api.example.com/v1';


  // Authentication endpoints
  static const String auth = '/auth';
  static const String signUp = '$auth/signup';
  static const String signIn = '$auth/signin';
  static const String signOut = '$auth/signout';
  static const String resetPassword = '$auth/reset-password';
  static const String verifyEmail = '$auth/verify-email';
  static const String currentUser = '$auth/me';
  static const String refreshToken = '$auth/refresh';

  // home endpoints
  // Movies
  static const String movie = 'movie/';
  static const String nowPlayingMovies = 'movie/now_playing';
  static const String popularMovies = 'movie/popular';

  // TV Series
  static const String tv = 'tv/';
  static const String airingTodayTv = 'tv/airing_today';
  static const String popularTv = 'tv/popular';

  // Shared
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  // AI
  static const String geminiBaseUrl = 'https://api.gemini.ai/v1/query';
}
