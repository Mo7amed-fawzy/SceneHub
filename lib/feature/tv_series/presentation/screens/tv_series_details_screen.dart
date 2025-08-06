import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_description_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_details_buttons_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_season_button.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_top_bar_nav.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_cast_and_crew_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_episode_details_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_rating_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_info_nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvSeriesDetailsScreen extends StatefulWidget {
  const TvSeriesDetailsScreen({super.key});

  @override
  State<TvSeriesDetailsScreen> createState() => _TvSeriesDetailsScreenState();
}

class _TvSeriesDetailsScreenState extends State<TvSeriesDetailsScreen> {
  @override
  void initState() {
    context.read<TvSeriesBloc>().add(FetchTvSeriesDetails(50821));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: BlocConsumer<TvSeriesBloc, TvSeriesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is TvSeriesLoaded) {
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
                                'https://image.tmdb.org/t/p/w500/${state.tvSeries.backdropPath}',
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
                                'https://image.tmdb.org/t/p/w500/${state.tvSeries.posterPath}',
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
                          year: state.tvSeries.firstAirDate?.year.toString(),
                          duration:
                              state.tvSeries.episodeRunTime?.isNotEmpty ?? false
                              ? '${state.tvSeries.episodeRunTime![0] * state.tvSeries.numberOfEpisodes!} Minutes'
                              : 'N/A',
                          genre: state.tvSeries.genres?.isNotEmpty ?? false
                              ? state.tvSeries.genres![0].name
                              : 'N/A',
                        ),
                      ),
                      Positioned(
                        left: 165.w,
                        bottom: 25.h,
                        child: TvRatingWidget(
                          rating: double.parse(
                            (state.tvSeries.voteAverage!).toStringAsFixed(1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        left: 20.w,
                        child: TvTopBarNav(title: state.tvSeries.name!),
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
                              state.tvSeries.overview ??
                              'No description available.',
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
                            TvCastAndCrewWidget(cast: state.tvCast),
                          ],
                        ),
                        SizedBox(height: 16.h),
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
                        const TvSeasonButton(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: const TvEpisodeDetailsWidget(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
