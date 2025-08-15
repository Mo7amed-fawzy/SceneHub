class EndpointConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String tvSeriesDetails = 'tv/';
  static const String movieDetails = 'movie/';
  static const String movieCast = '/credits';
  static const String tvSeriesSeason = '/season/';
  static const String tvSeriesCast = '/aggregate_credits';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';
  // Add your endpoints here

  static const String baseUrl1 = 'https://api.example.com/v1';

  // Authentication endpoints
  static const String auth = '/auth';
  static const String signUp = '$auth/signup';
  static const String signIn = '$auth/signin';
  static const String signOut = '$auth/signout';
  static const String resetPassword = '$auth/reset-password';
  static const String verifyEmail = '$auth/verify-email';
  static const String currentUser = '$auth/me';
  static const String refreshToken = '$auth/refresh';
}
