import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/select_season_button.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/episodes_list_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_description_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_details_buttons_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_top_bar_nav.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_cast_and_crew_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_rating_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_info_nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/tv_series_model.dart';

class TvSeriesDetailsScreen extends StatefulWidget {
  const TvSeriesDetailsScreen({super.key});
  final int tvSeriesId = 1396; // Example ID, can be passed dynamically

  @override
  State<TvSeriesDetailsScreen> createState() => _TvSeriesDetailsScreenState();
}

class _TvSeriesDetailsScreenState extends State<TvSeriesDetailsScreen> {
  TvSeriesDetailsModel? tvSeries;
  int seasonNumber = 1; // Default season number, can be changed dynamically
  @override
  void initState() {
    context.read<TvSeriesBloc>().add(FetchTvSeriesDetails(widget.tvSeriesId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: BlocSelector<TvSeriesBloc, TvSeriesState, TvSeriesDetailsModel?>(
        selector: (state) {
          if (state is TvSeriesDetailsLoaded) {
            tvSeries = state.tvSeries;
          }
          return tvSeries;
        },
        builder: (context, tvSeries) {
          if (tvSeries != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Opacity(
                        opacity: 0.24,
                        child: Container(
                          height: 450.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                'https://image.tmdb.org/t/p/w500/${tvSeries.backdropPath}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 450.h,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, 0.00),
                            end: Alignment(0.50, 1.00),
                            colors: [Color(0x911F1D2B), Color(0xFF1F1D2B)],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 95.w,
                        top: 80.h,
                        child: Container(
                          width: 190.w,
                          height: 270.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                'https://image.tmdb.org/t/p/w500/${tvSeries.posterPath}',
                              ),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50.w,
                        bottom: 50.h,
                        child: TvInfoNavWidget(
                          year: tvSeries.firstAirDate?.year.toString(),
                          duration: tvSeries.episodeRunTime?.isNotEmpty ?? false
                              ? '${tvSeries.episodeRunTime![0] * tvSeries.numberOfEpisodes!} Minutes'
                              : 'N/A',
                          genre: tvSeries.genres?.isNotEmpty ?? false
                              ? tvSeries.genres![0].name
                              : 'N/A',
                        ),
                      ),
                      Positioned(
                        left: 165.w,
                        bottom: 25.h,
                        child: TvRatingWidget(
                          rating: double.parse(
                            (tvSeries.voteAverage!).toStringAsFixed(1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        left: 20.w,
                        child: TvTopBarNav(title: tvSeries.name!),
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
                        const TvDetailsButtonsWidget(),
                        SizedBox(height: 4.h),
                        TvDescriptionWidget(
                          description:
                              tvSeries.overview ?? 'No description available.',
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Cast and Crew',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.12.w,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TvCastAndCrewWidget(tvSeriesId: widget.tvSeriesId),
                          ],
                        ),
                        12.verticalSpace,
                        Text(
                          'Episode',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.12.w,
                          ),
                        ),
                        SelectSeasonButton(
                          seasonNumber: seasonNumber,
                          tvSeriesId: widget.tvSeriesId,
                          numberOfSeasons: tvSeries.numberOfSeasons ?? 1,
                        ),

                        EpisodesListWidget(
                          tvSeriesId: widget.tvSeriesId,
                          seasonNumber: seasonNumber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
