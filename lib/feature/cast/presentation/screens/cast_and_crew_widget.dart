import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/feature/cast/presentation/bloc/cast_bloc.dart';
import 'package:ai_movie_app/feature/cast/presentation/widgets/actor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_text_styles.dart';

class CastAndCrewWidget extends StatefulWidget {
  const CastAndCrewWidget({
    super.key,
    this.tvSeriesId,
    this.movieId,
    this.isTvSeries = false,
  });
  final int? tvSeriesId;
  final int? movieId;
  final bool isTvSeries;

  @override
  State<CastAndCrewWidget> createState() => _CastAndCrewWidgetState();
}

class _CastAndCrewWidgetState extends State<CastAndCrewWidget> {
  @override
  void initState() {
    context.read<CastBloc>().add(
      widget.isTvSeries
          ? FetchTvSeriesCast(widget.tvSeriesId!)
          : FetchMovieCast(widget.movieId!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is CastLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.castAndCrew,
                style: CustomTextStyles.montserrat600style16.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.12.w,
                ),
              ),
              8.verticalSpace,
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: state is CastLoaded
                      ? state.tvCast.cast?.length ?? 5
                      : 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Get character name based on data structure
                    String getCharacterName() {
                      if (state is! CastLoaded) {
                        return AppStrings.unknownCharacter;
                      }
                      final cast = state.tvCast.cast![index];
                      // For TV series, character is in roles array
                      if (widget.tvSeriesId != null) {
                        return cast.roles?.isNotEmpty == true
                            ? cast.roles![0].character ??
                                  AppStrings.unknownCharacter
                            : AppStrings.unknownCharacter;
                      }
                      // For movies, character might be in roles or directly in cast
                      // First try roles (if available), then fallback
                      if (cast.roles?.isNotEmpty == true) {
                        return cast.roles![0].character ??
                            AppStrings.unknownCharacter;
                      }
                      return AppStrings.unknownCharacter;
                    }

                    return Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: ActorInfoWidget(
                        actorImageUrl: state is CastLoaded
                            ? state.tvCast.cast![index].profilePath ?? ''
                            : '',
                        actorName: state is CastLoaded
                            ? state.tvCast.cast![index].name ??
                                  AppStrings.unknownActor
                            : AppStrings.unknownActor,
                        characterName: getCharacterName(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
