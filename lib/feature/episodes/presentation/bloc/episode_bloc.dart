import 'package:ai_movie_app/feature/episodes/data/models/episodes_model.dart';
import 'package:ai_movie_app/feature/episodes/data/models/get_episodes_prams.dart';
import 'package:ai_movie_app/feature/episodes/domain/usecases/get_episode_details_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodeDetailsUseCase _getEpisodeDetailsUseCase;
  EpisodeBloc(this._getEpisodeDetailsUseCase) : super(EpisodeInitial()) {
    on<EpisodeEvent>((event, emit) async {
      if (event is FetchEpisodeDetails) {
        await _fetchEpisodeDetails(event.params, emit);
      }
    });
  }

  Future<void> _fetchEpisodeDetails(
    GetEpisodesParams params,
    Emitter<EpisodeState> emit,
  ) async {
    emit(EpisodeLoading());

    final episode = await _getEpisodeDetailsUseCase(params);
    episode.fold(
      (failure) {
        if (!emit.isDone) {
          emit(EpisodeError(failure.message));
        }
      },
      (episode) {
        if (!emit.isDone) {
          emit(EpisodeLoaded(episode));
        }
      },
    );
  }
}
