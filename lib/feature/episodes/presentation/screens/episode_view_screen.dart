import 'package:ai_movie_app/feature/episodes/data/models/get_episodes_prams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/episode_entities.dart';
import '../bloc/episode_bloc.dart';
import 'Episode_details_show.dart';

class EpisodeViewScreen extends StatefulWidget {
  const EpisodeViewScreen({super.key, required this.params});
  final GetEpisodesParams params;

  @override
  State<EpisodeViewScreen> createState() => _EpisodeViewScreenState();
}

class _EpisodeViewScreenState extends State<EpisodeViewScreen> {
  @override
  void initState() {
    context.read<EpisodeBloc>().add(FetchEpisodeDetails(widget.params));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: BlocBuilder<EpisodeBloc, EpisodeState>(
        builder: (context, state) {
          if (state is EpisodeLoaded) {
            return EpisodeDetailsShow(
              episodeEntity: state.episode,
              isLoading: false,
            );
          }
          if (state is EpisodeLoading) {
            return EpisodeDetailsShow(
              episodeEntity: EpisodeEntity(
                airDate: DateTime.now(),
                name: 'Episode Name',
                overview: 'Episode Overview',
                voteAverage: 0.0,
                runtime: 60,
                stillPath: '',
                crew: [],
                episodeType: 'episodeType',
              ),
              isLoading: true,
            );
          }
          if (state is EpisodeError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
