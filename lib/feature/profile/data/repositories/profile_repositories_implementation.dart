import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/errors/exceptions.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/feature/profile/data/datasources/profile_local_data_source.dart';
import 'package:ai_movie_app/feature/profile/domain/entities/profile.dart';
import 'package:ai_movie_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoriesImplementation extends ProfileRepository {
  ProfileRepositoriesImplementation({
    required ProfileLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final ProfileLocalDataSource _localDataSource;

  @override
  AsyncVoidResponse clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  AsyncSingleDataResponse<Profile> getUser() async {
    try {
      final result = await _localDataSource.getCachedUser();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  AsyncVoidResponse setEmail({required String email}) async {
    try {
      await _localDataSource.setUserEmail(email);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  AsyncVoidResponse setName({required String name}) async {
    try {
      await _localDataSource.setUserName(name);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  AsyncVoidResponse setPhoneNumber({required String phoneNumber}) async {
    try {
      await _localDataSource.setPhoneNumber(phoneNumber);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
