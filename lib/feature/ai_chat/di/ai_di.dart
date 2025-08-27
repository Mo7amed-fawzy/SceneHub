import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scenebot_cubit.dart';
import 'package:ai_movie_app/feature/ai_chat/data/datasource/scenebot_remote_data_source.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/conversation_flow.dart';
import 'package:get_it/get_it.dart';

import 'package:ai_movie_app/feature/ai_chat/domain/repositories/scenebot_repository.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/get_ai_response.dart';

final skk = GetIt.instance;

Future<void> initFeatureServiceLocator() async {
  // DataSource
  skk.registerLazySingleton<ScenebotRemoteDatasource>(
    () => ScenebotRemoteDatasource(),
  );

  // Repository
  skk.registerLazySingleton<ScenebotRepository>(
    () => ScenebotRepositoryImpl(skk()),
  );

  // UseCase
  skk.registerLazySingleton<GetAIResponseUseCase>(
    () => GetAIResponseUseCase(skk()),
  );

  // Cubit
  skk.registerFactory<ScenebotCubit>(() => ScenebotCubit(skk()));
}
