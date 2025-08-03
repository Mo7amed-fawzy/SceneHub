abstract class AppException implements Exception {
  final String message;
  final int statusCode;

  const AppException(this.message, this.statusCode);
}

class ServerException extends AppException {
  const ServerException(
      [super.message = 'Server Error', super.statusCode = 500]);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Cache Error', super.statusCode = 500]);
}
// Add more exceptions as needed
