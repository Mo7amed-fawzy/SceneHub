import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_text_styles.dart';

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
        8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(actorName, style: CustomTextStyles.montserrat600style14),
            Text(characterName, style: CustomTextStyles.montserrat500style10),
          ],
        ),
      ],
    );
  }
}
