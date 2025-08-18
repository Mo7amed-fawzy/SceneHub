import 'package:ai_movie_app/feature/home/domain/entities/movies_details_entity.dart';
import 'package:ai_movie_app/feature/home/domain/use_cases/get_details_usecase.dart';
import 'package:ai_movie_app/feature/home/domain/use_cases/get_mixed_now_playing_use_case.dart';
import 'package:ai_movie_app/feature/home/domain/use_cases/get_now_playing_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_media_event.dart';
part 'home_media_state.dart';

class HomeMediaBloc extends Bloc<HomeMediaEvent, HomeMediaState> {
  final GetDetailsUseCase getDetailsUseCase;
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetMixedNowPlayingUseCase getMixedNowPlayingUseCase;

  HomeMediaBloc({
    required this.getDetailsUseCase,
    required this.getNowPlayingUseCase,
    required this.getMixedNowPlayingUseCase,
  }) : super(HomeMediaInitial()) {
    on<GetDetailsEvent>(_onGetDetails);
    on<GetNowPlayingEvent>(_onGetNowPlaying);
    on<GetMixedNowPlayingEvent>(_onGetMixedNowPlaying);
  }

  Future<void> _onGetDetails(
    GetDetailsEvent event,
    Emitter<HomeMediaState> emit,
  ) async {
    emit(HomeMediaLoading());
    try {
      final result = await getDetailsUseCase(
        GetDetailsParams(id: event.id, mediaType: event.mediaType),
      );
      emit(HomeMediaDetailsLoaded(result));
    } catch (e) {
      emit(HomeMediaError(e.toString()));
    }
  }

  Future<void> _onGetNowPlaying(
    GetNowPlayingEvent event,
    Emitter<HomeMediaState> emit,
  ) async {
    emit(HomeMediaLoading());
    try {
      final result = await getNowPlayingUseCase(event.mediaType);
      emit(HomeMediaListLoaded(result));
    } catch (e) {
      emit(HomeMediaError(e.toString()));
    }
  }

  Future<void> _onGetMixedNowPlaying(
    GetMixedNowPlayingEvent event,
    Emitter<HomeMediaState> emit,
  ) async {
    emit(HomeMediaLoading());
    try {
      final result = await getMixedNowPlayingUseCase();
      emit(HomeMediaListLoaded(result));
    } catch (e) {
      emit(HomeMediaError(e.toString()));
    }
  }
}
