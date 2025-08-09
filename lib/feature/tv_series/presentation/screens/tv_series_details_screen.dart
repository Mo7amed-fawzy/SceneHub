import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/tv_series_entities.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/screens/tv_data_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/genre_entity.dart';

class TvSeriesDetailsScreen extends StatefulWidget {
  const TvSeriesDetailsScreen({super.key, required this.tvSeriesId});
  final int tvSeriesId; //= 1396; // Example ID, can be passed dynamically

  @override
  State<TvSeriesDetailsScreen> createState() => _TvSeriesDetailsScreenState();
}

class _TvSeriesDetailsScreenState extends State<TvSeriesDetailsScreen> {
  TvSeriesDetailsEntity? tvSeries;
  int seasonNumber = 1; // Default season number, can be changed dynamically
  @override
  void initState() {
    context.read<TvSeriesBloc>().add(FetchTvSeriesDetails(widget.tvSeriesId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocSelector<TvSeriesBloc, TvSeriesState, TvSeriesDetailsEntity?>(
        selector: (state) {
          if (state is TvSeriesDetailsLoaded) {
            tvSeries = state.tvSeries;
          }
          return tvSeries;
        },
        builder: (context, tvSeries) {
          if (tvSeries != null) {
            return TvDataShow(
              widget: widget,
              seasonNumber: seasonNumber,
              tvSeries: tvSeries,
            );
          }
          return TvDataShow(
            widget: widget,
            seasonNumber: seasonNumber,
            tvSeries: TvSeriesDetailsEntity(
              backdropPath:
                  'https://image.tmdb.org/t/p/w500/sample_backdrop.jpg',
              posterPath: 'https://image.tmdb.org/t/p/w500/sample_poster.jpg',
              name: 'Sample TV Series',
              firstAirDate: DateTime(2023),
              episodeRunTime: [60],
              genres: [const GenreEntity(name: 'Drama')],
              numberOfEpisodes: 10,
              numberOfSeasons: 2,
              overview:
                  'This is a sample description for the TV series ajshldol aoi;sfhaosi; aiosfaio;sdh aoi;sdjhfgais;jd iao;gfoiap;d.',
              voteAverage: 8.5,
            ),
          );
        },
      ),
    );
  }
}
