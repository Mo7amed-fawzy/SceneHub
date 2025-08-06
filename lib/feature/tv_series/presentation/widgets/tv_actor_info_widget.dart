import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvActorInfoWidget extends StatelessWidget {
  const TvActorInfoWidget({
    super.key,
    required this.actorImageUrl,
    required this.actorName,
    required this.characterName,
  });
  final String actorImageUrl;
  final String actorName;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500/$actorImageUrl',
            width: 40.w,
            height: 40.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              actorName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.12.w,
              ),
            ),
            Text(
              characterName,
              style: TextStyle(
                color: Color(0xFF92929D),
                fontSize: 10.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.12.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
