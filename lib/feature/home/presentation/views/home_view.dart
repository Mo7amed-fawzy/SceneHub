import 'package:ai_movie_app/core/functions/calculate_grid_count.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/home_media_bloc.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/cards.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/category_tab.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: SafeArea(
        child: BlocBuilder<HomeMediaBloc, HomeMediaState>(
          builder: (context, state) {
            if (state is HomeMediaLoading || state is HomeMediaInitial) {
              return buildSkeletonLoading();
            }

            if (state is HomeMediaError) {
              return Center(child: Text(state.message));
            }

            if (state is HomeMediaListLoaded) {
              final movies = state.mediaList; // List<HomeMediaEntity>
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What do you want to watch?",
                          style: CustomTextStyles.poppins600style18.copyWith(
                            color: AppColorsDark.text,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        GestureDetector(
                          onTap: () => showToast("Search feature coming soon!"),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColorsDark.secondaryColor,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColorsDark.text,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Search",
                                  style: TextStyle(
                                    color: AppColorsDark.text,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Horizontal big poster list
                  SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return interactiveBigPoster(
                          movie.posterPath ?? '',
                          movie.id ?? 0,
                          movie.mediaType,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Category tabs
                  SizedBox(
                    height: 35.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      children: const [
                        CategoryTab(text: "Now playing", selected: true),
                        CategoryTab(text: "Upcoming"),
                        CategoryTab(text: "Top rated"),
                        CategoryTab(text: "Popular"),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // small poster grid
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = responsiveGridCount(constraints);

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: movies.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                mainAxisSpacing: 8.h,
                                crossAxisSpacing: 8.w,
                                childAspectRatio: 0.65,
                              ),
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return interactiveSmallPoster(
                              movie.posterPath ?? '',
                              movie.id ?? 0,
                              movie.mediaType,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
