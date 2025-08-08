abstract class Failure {
  final String message;
  final int statusCode;

  Failure(this.message, this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Server Error', super.statusCode = 500]);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = 'Cache Error', super.statusCode = 500]);
}

// Add more failures as needed
class AuthFailure extends Failure {
  AuthFailure([super.message = 'Authentication Error', super.statusCode = 401]);
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = 'Network Error', super.statusCode = 503]);
}

class FormatFailure extends Failure {
  FormatFailure([super.message = 'Format Error', super.statusCode = 422]);
}
