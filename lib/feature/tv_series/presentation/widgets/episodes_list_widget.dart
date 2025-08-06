import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/season/tv_season_model.dart';
import '../bloc/tv_series_bloc.dart';
import 'tv_episode_details_widget.dart';

class EpisodesListWidget extends StatefulWidget {
  const EpisodesListWidget({
    super.key,
    required this.tvSeriesId,
    required this.seasonNumber,
  });
  final int tvSeriesId;
  final int seasonNumber;

  @override
  State<EpisodesListWidget> createState() => _EpisodesListWidgetState();
}

class _EpisodesListWidgetState extends State<EpisodesListWidget> {
  TvSeasonModel? tvSeason;
  @override
  void initState() {
    context.read<TvSeriesBloc>().add(
      FetchTvSeriesSeasonDetails(
        id: widget.tvSeriesId,
        seasonNumber: widget.seasonNumber,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TvSeriesBloc, TvSeriesState, TvSeasonModel?>(
      selector: (state) {
        if (state is TvSeriesSeasonDetailsLoaded) {
          tvSeason = state.tvSeason;
        }
        return tvSeason;
      },
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tvSeason?.episodes?.length ?? 0,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            final episode = tvSeason?.episodes?[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: TvEpisodeDetailsWidget(
                episodeDuration: episode?.runtime != null
                    ? '${episode!.runtime!} Minutes'
                    : 'N/A',
                episodeTitle: episode?.name ?? 'Unknown Episode',
                episodeDescription:
                    episode?.overview ?? 'No description available.',
                episodeImageUrl: episode?.stillPath ?? 'episode_image.jpg',
                episodeNumber: episode?.episodeNumber ?? 0,
              ),
            );
          },
        );
      },
    );
  }
}
