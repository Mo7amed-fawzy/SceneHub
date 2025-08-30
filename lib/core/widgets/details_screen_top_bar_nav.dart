import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsScreenTopBarNav extends StatelessWidget {
  const DetailsScreenTopBarNav({
    super.key,
    required this.title,
    required this.isLoading,
    this.movieId,
    required this.posterPath,
  });

  final String title;
  final bool isLoading;
  final int? movieId;
  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                color: AppColorsDark.dialogBackground,
              ),
              child: SvgPicture.asset(
                AppStyle.icons.backArrow,
                width: 16.w,
                height: 16.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(
            width: 270.w,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.montserrat600style16.copyWith(
                color: Colors.white,
                letterSpacing: 0.12,
              ),
            ),
          ),

          // Heart button
          if (movieId != null)
            Builder(
              builder: (context) {
                final cubit = context.read<WishlistCubit>();

                return GestureDetector(
                  onTap: () {
                    final movieEntity = WishlistEntity(
                      id: movieId!.toString(),
                      name: title,
                      posterPath: posterPath ?? AppStyle.images.avengers,
                      addedAt: DateTime.now(),
                    );

                    cubit.toggleWishlist(movieEntity); // استخدم الطريقة الموحدة
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      color: AppColorsDark.dialogBackground,
                    ),
                    child: Center(
                      child: BlocBuilder<WishlistCubit, WishlistState>(
                        builder: (context, state) {
                          final isFavNow = state is WishlistLoaded
                              ? state.items.any(
                                  (item) => item.id == movieId!.toString(),
                                )
                              : false;

                          return SvgPicture.asset(
                            AppStyle.icons.heart,
                            width: 20.w,
                            height: 20.h,
                            fit: BoxFit.cover,
                            color: isFavNow
                                ? AppColorsDark.rating
                                : Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
