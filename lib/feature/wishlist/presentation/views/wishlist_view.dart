import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
    );

    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColorsDark.primaryColor,
        elevation: 0,
        title: Text(
          "My Wishlist",
          style: CustomTextStyles.montserrat600style24.copyWith(
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.redAccent,
              size: 28.sp,
            ),
            onPressed: () {
              context.read<WishlistCubit>().clearWishlist();
              showToast("Wishlist cleared", Colors.redAccent);
            },
          ),
        ],
      ),
      body: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (context, state) {
          if (state is WishlistOperationSuccess) {
            showToast(state.message);
          } else if (state is WishlistOperationFailure) {
            showToast(state.message, Colors.redAccent);
          }
        },
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WishlistLoaded) {
            final items = state.items;
            if (items.isEmpty) return _emptyState();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.65.w / 1.h,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _wishlistCard(item, () {
                    context.read<WishlistCubit>().removeFromWishlist(
                      int.parse(item.id),
                    );
                    showToast("${item.name} removed");
                  });
                },
              ),
            );
          } else if (state is WishlistError) {
            return Center(
              child: Text(state.message, style: TextStyle(fontSize: 16.sp)),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _wishlistCard(WishlistEntity item, VoidCallback onRemove) {
    return GestureDetector(
      onTap: () => context.push('/movie/${item.id}', extra: item),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColorsDark.secondaryColor,
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: AppColorsDark.gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 6.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final imageHeight = constraints.maxHeight * 0.65;
                final textHeight = constraints.maxHeight - imageHeight;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: imageHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                        child: InkWell(
                          onTap: () =>
                              context.push('/movie/${item.id}', extra: item),
                          child: Image.network(
                            item.posterPath.startsWith('http')
                                ? item.posterPath
                                : '${EndpointConstants.imageBaseUrl}${item.posterPath}',
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color: AppColorsDark.disabled,
                                  child: Icon(
                                    Icons.broken_image,
                                    color: AppColorsDark.text,
                                    size: 50.sp,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: textHeight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 6.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              item.name,
                              style: CustomTextStyles.montserrat600style16
                                  .copyWith(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black45,
                                        blurRadius: 4.r,
                                        offset: Offset(1.w, 1.h),
                                      ),
                                    ],
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              "Added: ${item.addedAt.day}/${item.addedAt.month}/${item.addedAt.year}",
                              style: CustomTextStyles.montserrat500style10
                                  .copyWith(
                                    fontSize: 10.sp,
                                    color: Colors.white70,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4.r,
                      offset: Offset(1.w, 2.h),
                    ),
                  ],
                ),
                child: Icon(Icons.close, size: 18.sp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80.sp,
              color: AppColorsDark.hashedText,
            ),
            SizedBox(height: 16.h),
            Text(
              "Your wishlist is empty",
              style: CustomTextStyles.montserrat500style20.copyWith(
                fontSize: 20.sp,
                color: AppColorsDark.text,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 4.r,
                    offset: Offset(1.w, 1.h),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              "Add your favorite movies to see them here",
              style: CustomTextStyles.montserrat500style14.copyWith(
                fontSize: 14.sp,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
