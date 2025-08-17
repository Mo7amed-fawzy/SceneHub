part of 'episode_bloc.dart';

@immutable
sealed class EpisodeEvent {}

class FetchEpisodeDetails extends EpisodeEvent {
  final GetEpisodesParams params;

  FetchEpisodeDetails(this.params);
}
