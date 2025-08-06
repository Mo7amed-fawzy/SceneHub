import 'package:ai_movie_app/feature/tv_series/domain/entities/cast_entities.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_actor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/tv_series_bloc.dart';

class TvCastAndCrewWidget extends StatefulWidget {
  const TvCastAndCrewWidget({super.key, required this.tvSeriesId});
  final int tvSeriesId;

  @override
  State<TvCastAndCrewWidget> createState() => _TvCastAndCrewWidgetState();
}

class _TvCastAndCrewWidgetState extends State<TvCastAndCrewWidget> {
  TvCastEntity? tvCast;
  @override
  void initState() {
    context.read<TvSeriesBloc>().add(FetchTvSeriesCast(widget.tvSeriesId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TvSeriesBloc, TvSeriesState, TvCastEntity?>(
      selector: (state) {
        if (state is TvSeriesCastLoaded) {
          tvCast = state.tvCast;
        }
        return tvCast;
      },
      builder: (context, state) {
        if (tvCast != null) {
          return SizedBox(
            height: 40.h,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: tvCast?.cast?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: TvActorInfoWidget(
                    actorImageUrl: tvCast?.cast![index].profilePath ?? '',
                    actorName: tvCast?.cast![index].name ?? 'Unknown Actor',
                    characterName:
                        tvCast?.cast![index].roles![0].character ??
                        'Unknown Character',
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
