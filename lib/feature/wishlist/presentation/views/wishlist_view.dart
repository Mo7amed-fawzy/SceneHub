import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    // Fetch wishlist on init
    context.read<WishlistCubit>().fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColorsDark.primaryColor,
        elevation: 0,
        title: Text(
          "My Wishlist",
          style: CustomTextStyles.montserrat600style24,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.redAccent),
            onPressed: () => context.read<WishlistCubit>().clearWishlist(),
          ),
        ],
      ),
      body: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (context, state) {
          if (state is WishlistOperationSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is WishlistOperationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.redAccent,
              ),
            );
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
                  childAspectRatio: 0.65,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return _wishlistCard(
                    item,
                    () => context.read<WishlistCubit>().removeFromWishlist(
                      int.parse(item.id),
                    ),
                  );
                },
              ),
            );
          } else if (state is WishlistError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _wishlistCard(WishlistEntity item, VoidCallback onRemove) {
    return Stack(
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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.network(
                  item.posterPath,
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180.h,
                      color: AppColorsDark.disabled,
                      child: Icon(
                        Icons.broken_image,
                        color: AppColorsDark.text,
                        size: 50.sp,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: CustomTextStyles.montserrat600style16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Added: ${item.addedAt.day}/${item.addedAt.month}/${item.addedAt.year}",
                      style: CustomTextStyles.montserrat500style10,
                    ),
                  ],
                ),
              ),
            ],
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
              ),
              child: Icon(Icons.close, size: 18.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emptyState() {
    return Center(
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
            style: CustomTextStyles.montserrat500style20,
          ),
          SizedBox(height: 8.h),
          Text(
            "Add your favorite movies to see them here",
            style: CustomTextStyles.montserrat500style14,
          ),
        ],
      ),
    );
  }
}
