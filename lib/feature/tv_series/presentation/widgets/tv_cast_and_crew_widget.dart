import 'package:ai_movie_app/feature/tv_series/data/models/cast/tv_cast_model.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_actor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvCastAndCrewWidget extends StatelessWidget {
  const TvCastAndCrewWidget({super.key, required this.cast});
  final TvCastModel cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        itemCount: cast.cast?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.0.w),
            child: TvActorInfoWidget(
              actorImageUrl: cast.cast![index].profilePath ?? '',
              actorName: cast.cast![index].name ?? 'Unknown Actor',
              characterName:
                  cast.cast![index].roles![0].character ?? 'Unknown Character',
            ),
          );
        },
      ),
    );
  }
}
