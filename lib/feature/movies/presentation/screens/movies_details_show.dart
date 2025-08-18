import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/widgets/details_screen_buttons_widget.dart';
import 'package:ai_movie_app/core/widgets/details_screen_info_nav.dart';
import 'package:ai_movie_app/core/widgets/details_screen_top_bar_nav.dart';
import 'package:ai_movie_app/feature/movies/domain/entities/movies_details_entity.dart';
import 'package:ai_movie_app/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_description_widget.dart';
import 'package:ai_movie_app/core/utils/details_screen_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/services/service_locator.dart';
import '../../../cast/presentation/bloc/cast_bloc.dart';
import '../../../cast/presentation/screens/cast_and_crew_widget.dart';

class MoviesDetailsShow extends StatelessWidget {
  const MoviesDetailsShow({
    super.key,
    required this.moviesDetails,
    required this.movieId,
  });
  final MoviesDetailsEntity moviesDetails;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Skeletonizer(
                enabled:
                    context.watch<MoviesBloc>().state is MoviesDetailsLoading,
                child: Opacity(
                  opacity: 0.24,
                  child: Container(
                    height: 450.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          '${EndpointConstants.imageBaseUrl}${moviesDetails.backdropPath}',
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
                  enabled: false,
                  child: Container(
                    width: 190.w,
                    height: 270.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          '${EndpointConstants.imageBaseUrl}${moviesDetails.posterPath}',
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
                  isLoading: false,
                  year: moviesDetails.releaseDate?.year.toString(),
                  duration: moviesDetails.runtime != null
                      ? '${moviesDetails.runtime} ${AppStrings.minutes}'
                      : AppStrings.notAvailable,
                  genre: moviesDetails.genres?.isNotEmpty ?? false
                      ? moviesDetails.genres![0].name
                      : AppStrings.notAvailable,
                ),
              ),
              Positioned(
                left: 165.w,
                bottom: 25.h,
                child: DetailsScreenRatingWidget(
                  isLoading: false,
                  rating: double.parse(
                    (moviesDetails.voteAverage ?? 0).toStringAsFixed(1),
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                left: 20.w,
                child: DetailsScreenTopBarNav(
                  title: moviesDetails.title ?? AppStrings.notAvailable,
                  isLoading:
                      context.watch<MoviesBloc>().state is MoviesDetailsLoading,
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
                DetailsScreenButtonsWidget(
                  buttonColor: AppColorsDark.rating,
                  text: 'Play',
                ),
                4.verticalSpace,
                TvDescriptionWidget(
                  description:
                      moviesDetails.overview ?? AppStrings.notAvailable,
                  isLoading:
                      context.watch<MoviesBloc>().state is MoviesDetailsLoading,
                ),
                16.verticalSpace,
                BlocProvider(
                  create: (context) => CastBloc(sl(), sl()),
                  child: CastAndCrewWidget(movieId: movieId),
                ),
                12.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
