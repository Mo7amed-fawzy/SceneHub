import 'package:ai_movie_app/feature/episodes/data/models/get_episodes_prams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/episodes_model.dart';
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
            return EpisodeDetailsShow(episodesModel: state.episode);
          }
          if (state is EpisodeLoading) {
            return EpisodeDetailsShow(
              episodesModel: EpisodesModel(
                airDate: DateTime.now(),
                id: 0,
                name: 'Episode Name',
                overview: 'Episode Overview',
                voteAverage: 0.0,
                runtime: 60,
                productionCode: 'Production Code',
                stillPath: 'Still Path',
                crew: [],
                episodeNumber: 2,
                episodeType: 'episodeType',
                guestStars: [],
                seasonNumber: 3,
                voteCount: 3,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
