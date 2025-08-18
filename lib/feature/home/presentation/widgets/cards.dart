import 'package:ai_movie_app/feature/home/presentation/widgets/interactive_poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget interactiveBigPoster(String imagePath, int itemId, String mediaType) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double posterWidth;

      if (screenWidth >= 1200) {
        posterWidth = screenWidth / 5;
      } else if (screenWidth >= 800) {
        posterWidth = screenWidth / 4;
      } else {
        posterWidth = screenWidth / 2.5;
      }

      return InteractivePoster(
        imagePath: imagePath,
        width: posterWidth.w,
        height: 220.h,
        borderRadius: 16.r,
        itemId: itemId,
        mediaType: mediaType,
      );
    },
  );
}

Widget interactiveSmallPoster(String imagePath, int itemId, String mediaType) {
  return InteractivePoster(
    imagePath: imagePath,
    width: 100.w,
    height: 160.h,
    borderRadius: 8.r,
    itemId: itemId,
    mediaType: mediaType,
  );
}
