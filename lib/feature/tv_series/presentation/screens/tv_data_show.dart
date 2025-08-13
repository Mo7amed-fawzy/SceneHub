import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/tv_series_entities.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/screens/tv_series_details_screen.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/episodes_list_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/select_season_button.dart';
import 'package:ai_movie_app/feature/cast/presentation/screens/cast_and_crew_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_description_widget.dart';
import 'package:ai_movie_app/core/widgets/details_screen_buttons_widget.dart';
import 'package:ai_movie_app/core/widgets/details_screen_info_nav.dart';
import 'package:ai_movie_app/core/utils/details_screen_rating_widget.dart';
import 'package:ai_movie_app/core/widgets/details_screen_top_bar_nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../cast/presentation/bloc/cast_bloc.dart';

class TvDataShow extends StatelessWidget {
  const TvDataShow({
    super.key,
    required this.widget,
    required this.seasonNumber,
    required this.tvSeries,
  });

  final TvSeriesDetailsScreen widget;
  final int seasonNumber;
  final TvSeriesDetailsEntity tvSeries;

  @override
  Widget build(BuildContext context) {
    int totalDuration = 0;
    if (tvSeries.episodeRunTime?.isNotEmpty ?? false) {
      for (var element in tvSeries.episodeRunTime!) {
        totalDuration += element;
      }
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Skeletonizer(
                enabled:
                    context.watch<TvSeriesBloc>().state
                        is TvSeriesDetailsLoading,
                child: Opacity(
                  opacity: 0.24,
                  child: Container(
                    height: 450.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          '${EndpointConstants.imageBaseUrl}${tvSeries.backdropPath}',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 450.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.50, 0.00),
                    end: const Alignment(0.50, 1.00),
                    colors: AppColorsDark.gradientColors,
                  ),
                ),
              ),
              Positioned(
                left: 95.w,
                top: 80.h,
                child: Skeletonizer(
                  enabled:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesDetailsLoading,
                  child: Container(
                    width: 190.w,
                    height: 270.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          '${EndpointConstants.imageBaseUrl}${tvSeries.posterPath}',
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 65.w,
                bottom: 50.h,
                child: DetailsScreenInfoNavWidget(
                  isLoading:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesDetailsLoading,
                  year: tvSeries.firstAirDate?.year.toString(),
                  duration: tvSeries.episodeRunTime?.isNotEmpty ?? false
                      ? '$totalDuration ${AppStrings.minutes}'
                      : AppStrings.notAvailabl,
                  genre: tvSeries.genres?.isNotEmpty ?? false
                      ? tvSeries.genres![0].name
                      : AppStrings.notAvailabl,
                ),
              ),
              Positioned(
                left: 165.w,
                bottom: 25.h,
                child: DetailsScreenRatingWidget(
                  isLoading:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesDetailsLoading,
                  rating: double.parse(
                    (tvSeries.voteAverage!).toStringAsFixed(1),
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                left: 20.w,
                child: DetailsScreenTopBarNav(
                  title: tvSeries.name!,
                  isLoading:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesDetailsLoading,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                const DetailsScreenButtonsWidget(),
                4.verticalSpace,
                TvDescriptionWidget(
                  isLoading:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesDetailsLoading,
                  description:
                      tvSeries.overview ?? AppStrings.noDescriptionAvailable,
                ),
                16.verticalSpace,
                BlocProvider(
                  create: (context) => CastBloc(sl(), sl()),
                  child: CastAndCrewWidget(
                    tvSeriesId: widget.tvSeriesId,
                    isTvSeries: true,
                  ),
                ),
                12.verticalSpace,
                Skeletonizer(
                  enabled:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesDetailsLoading ||
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesSeasonDetailsLoading,
                  child: Text(
                    AppStrings.episode,
                    style: CustomTextStyles.montserrat600style16.copyWith(
                      color: Colors.white,
                      letterSpacing: 0.12.w,
                    ),
                  ),
                ),
                SelectSeasonButton(
                  seasonNumber: seasonNumber,
                  tvSeriesId: widget.tvSeriesId,
                  numberOfSeasons: tvSeries.numberOfSeasons ?? 1,
                ),
                EpisodesListWidget(
                  isLoading:
                      context.watch<TvSeriesBloc>().state
                          is TvSeriesSeasonDetailsLoading,
                  tvSeriesId: widget.tvSeriesId,
                  numberOfSeasons: tvSeries.numberOfSeasons ?? 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
