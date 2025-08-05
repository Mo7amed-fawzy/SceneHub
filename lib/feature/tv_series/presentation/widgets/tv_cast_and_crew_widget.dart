import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_actor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvCastAndCrewWidget extends StatelessWidget {
  const TvCastAndCrewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.0.w),
            child: const TvActorInfoWidget(),
          );
        },
      ),
    );
  }
}
