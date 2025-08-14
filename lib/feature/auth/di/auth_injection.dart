import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_local_data_source_impl.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:ai_movie_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_movie_app/feature/auth/data/services/auth_network_service.dart';
import 'package:ai_movie_app/feature/auth/data/services/auth_data_orchestrator.dart';
import 'package:ai_movie_app/feature/auth/data/services/auth_sync_service.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/is_email_verified_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/send_email_verification_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/validate_auth_credentials_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/validate_signup_credentials_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/signup_with_validation_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/signin_with_validation_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/map_auth_failure_to_message_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> initAuthDependencies() async {
  // Data Sources
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: getIt<AppPreferences>()),
  );

  getIt.registerLazySingleton<AuthNetworkService>(
    () => AuthNetworkService(getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<AuthNetworkService>()),
  );

  // Data Orchestrator
  getIt.registerLazySingleton<AuthDataOrchestrator>(
    () => AuthDataOrchestrator(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  // Sync Service
  getIt.registerLazySingleton<AuthSyncService>(
    () => AuthSyncService(
      dataOrchestrator: getIt<AuthDataOrchestrator>(),
      networkService: getIt<AuthNetworkService>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton(() => const ValidateAuthCredentialsUseCase());
  getIt.registerLazySingleton(() => const ValidateSignupCredentialsUseCase());
  getIt.registerLazySingleton(() => SignOutUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
    () => ResetPasswordUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetCurrentUserUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(() => IsSignedInUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
    () => IsEmailVerifiedUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(
    () => SendEmailVerificationUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(() => SignUpUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => SignInUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => const MapAuthFailureToMessageUseCase());
  getIt.registerLazySingleton(
    () => SignupWithValidationUseCase(
      validateUseCase: getIt<ValidateSignupCredentialsUseCase>(),
      signUpUseCase: getIt<SignUpUseCase>(),
    ),
  );
  getIt.registerLazySingleton(
    () => SigninWithValidationUseCase(
      validateUseCase: getIt<ValidateAuthCredentialsUseCase>(),
      signInUseCase: getIt<SignInUseCase>(),
    ),
  );

  // Cubit
  getIt.registerFactory(
    () => AuthCubit(
      signupWithValidationUseCase: getIt<SignupWithValidationUseCase>(),
      signinWithValidationUseCase: getIt<SigninWithValidationUseCase>(),
      signOutUseCase: getIt<SignOutUseCase>(),
      resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      isSignedInUseCase: getIt<IsSignedInUseCase>(),
      isEmailVerifiedUseCase: getIt<IsEmailVerifiedUseCase>(),
      sendEmailVerificationUseCase: getIt<SendEmailVerificationUseCase>(),
      mapFailureToMessageUseCase: getIt<MapAuthFailureToMessageUseCase>(),
    ),
  );
}
