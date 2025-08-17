import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/exceptions.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/auth_services/auth_data_orchestrator.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/user_entity.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final AuthDataOrchestrator _dataOrchestrator;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  }) : _dataOrchestrator = AuthDataOrchestrator(
         remoteDataSource: remoteDataSource,
         localDataSource: localDataSource,
       );

  @override
  Future<Either<Failure, UserEntity>> signUp(
    AuthCredentials credentials,
  ) async {
    try {
      // Attempt remote signup
      final userModel = await remoteDataSource.signUp(credentials);

      // Cache the user locally for offline access
      await localDataSource.cacheUser(userModel);

      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
    AuthCredentials credentials,
  ) async {
    try {
      // Attempt remote signin
      final userModel = await remoteDataSource.signIn(credentials);

      // Cache the user locally for offline access
      await localDataSource.cacheUser(userModel);

      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      // Attempt remote signout
      await remoteDataSource.signOut();

      // Clear local cache regardless of remote success
      await localDataSource.clearCachedUser();
      await localDataSource.clearCachedAuthToken();

      return const Right(null);
    } on ServerException catch (e) {
      // Even if remote fails, clear local cache
      try {
        await localDataSource.clearCachedUser();
        await localDataSource.clearCachedAuthToken();
      } catch (_) {
        // Ignore local cache clearing errors
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await remoteDataSource.resetPassword(email);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      // Use data orchestrator for smart data fetching
      final user = await _dataOrchestrator.fetchUserData(
        maxCacheAge: const Duration(hours: 1), // Cache for 1 hour
      );
      return Right(user);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    try {
      // Use data orchestrator for smart authentication state checking
      final isSignedIn = await _dataOrchestrator.checkAuthenticationState(
        maxCacheAge: const Duration(hours: 1), // Cache for 1 hour
      );
      return Right(isSignedIn);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() async {
    try {
      // Use data orchestrator for smart email verification checking
      final isVerified = await _dataOrchestrator.checkEmailVerification(
        maxCacheAge: const Duration(hours: 1), // Cache for 1 hour
      );
      return Right(isVerified);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      await remoteDataSource.sendEmailVerification();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
