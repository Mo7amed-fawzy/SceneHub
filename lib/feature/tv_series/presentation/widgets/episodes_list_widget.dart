import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/feature/episodes/data/models/get_episodes_prams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/season_entities.dart';
import '../bloc/tv_series_bloc.dart';
import 'tv_episode_details_widget.dart';

class EpisodesListWidget extends StatefulWidget {
  const EpisodesListWidget({
    super.key,
    required this.tvSeriesId,
    required this.numberOfSeasons,
    required this.isLoading,
  });
  final int tvSeriesId;
  final int numberOfSeasons;
  final bool isLoading;
  @override
  State<EpisodesListWidget> createState() => _EpisodesListWidgetState();
}

class _EpisodesListWidgetState extends State<EpisodesListWidget> {
  int seasonNumber = 1;
  TvSeasonEntity? tvSeason;
  @override
  void initState() {
    context.read<TvSeriesBloc>().add(
      FetchTvSeriesSeasonDetails(
        id: widget.tvSeriesId,
        seasonNumber: seasonNumber,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: tvSeason == null || widget.isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          BlocSelector<TvSeriesBloc, TvSeriesState, TvSeasonEntity?>(
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
                    child: GestureDetector(
                      onTap: () {
                        customNavigate(
                          context,
                          episodeView,
                          extra: GetEpisodesParams(
                            seriesId: widget.tvSeriesId,
                            seasonNumber: seasonNumber,
                            episodeNumber: episode!.episodeNumber!,
                          ),
                        );
                      },
                      child: TvEpisodeDetailsWidget(
                        episodeDuration: episode?.runtime != null
                            ? '${episode!.runtime!} ${AppStrings.minutes}'
                            : AppStrings.notAvailable,
                        episodeTitle: episode?.name ?? AppStrings.notAvailable,
                        episodeDescription:
                            episode?.overview ??
                            AppStrings.noDescriptionAvailable,
                        episodeImageUrl:
                            episode?.stillPath ?? 'episode_image.jpg',
                        episodeNumber: episode?.episodeNumber ?? 0,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
