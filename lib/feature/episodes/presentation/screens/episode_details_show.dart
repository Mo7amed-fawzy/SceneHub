import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/widgets/details_screen_buttons_widget.dart';
import 'package:ai_movie_app/core/widgets/details_screen_info_nav.dart';
import 'package:ai_movie_app/core/widgets/details_screen_top_bar_nav.dart';
import 'package:ai_movie_app/feature/episodes/domain/entities/episode_entities.dart';
import 'package:ai_movie_app/feature/episodes/presentation/bloc/episode_bloc.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_description_widget.dart';
import 'package:ai_movie_app/core/utils/details_screen_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/utils/app_text_styles.dart';

class EpisodeDetailsShow extends StatelessWidget {
  const EpisodeDetailsShow({super.key, required this.episodeEntity});
  final EpisodeEntity episodeEntity;

  @override
  Widget build(BuildContext context) {
    String imageUrl = episodeEntity.stillPath.isNotEmpty
        ? '${EndpointConstants.imageBaseUrl}${episodeEntity.stillPath}'
        : '';

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Skeletonizer(
                enabled: context.watch<EpisodeBloc>().state is EpisodeLoading,
                child: Opacity(
                  opacity: 0.24,
                  child: SizedBox(
                    height: 450.h,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[800], height: 450.h),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[800],
                        height: 450.h,
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                          size: 50,
                        ),
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
                top: 150.h,
                child: Skeletonizer(
                  enabled: false,
                  child: SizedBox(
                    width: 190.w,
                    height: 170.h,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[800],
                        width: 190.w,
                        height: 170.h,
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[800],
                        width: 190.w,
                        height: 170.h,
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white,
                        ),
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
                  year: episodeEntity.airDate.year.toString(),
                  duration: '${episodeEntity.runtime} ${AppStrings.minutes}',
                  genre: episodeEntity.episodeType,
                ),
              ),
              Positioned(
                left: 165.w,
                bottom: 25.h,
                child: DetailsScreenRatingWidget(
                  isLoading: false,
                  rating: double.parse(
                    (episodeEntity.voteAverage).toStringAsFixed(1),
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                left: 20.w,
                child: DetailsScreenTopBarNav(
                  title: episodeEntity.name,
                  isLoading:
                      context.watch<EpisodeBloc>().state is EpisodeLoading,
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
                  description: episodeEntity.overview,
                  isLoading:
                      context.watch<EpisodeBloc>().state is EpisodeLoading,
                ),
                16.verticalSpace,
                Text(
                  AppStrings.castAndCrew,
                  style: CustomTextStyles.montserrat600style16.copyWith(
                    color: Colors.white,
                    letterSpacing: 0.12.w,
                  ),
                ),
                8.verticalSpace,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: episodeEntity.crew.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final crewMember = episodeEntity.crew[index];
                    return ListTile(
                      title: Text(
                        crewMember.name ?? '',
                        style: CustomTextStyles.montserrat600style16.copyWith(
                          color: Colors.white,
                          letterSpacing: 0.12.w,
                        ),
                      ),
                      subtitle: Text(
                        crewMember.job ?? '',
                        style: CustomTextStyles.montserrat400style14.copyWith(
                          color: Colors.grey,
                          letterSpacing: 0.12.w,
                        ),
                      ),
                    );
                  },
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
