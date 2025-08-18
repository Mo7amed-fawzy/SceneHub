import 'package:ai_movie_app/core/functions/calculate_grid_count.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/home/di/home_di.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/movies_bloc.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/movies_event.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/movies_state.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/cards.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/category_tab.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(sl())..add(FetchNowPlayingEvent()),
      child: Scaffold(
        backgroundColor: AppColorsDark.backgroundColor,
        body: SafeArea(
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoading || state is MoviesInitial) {
                return ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  children: [
                    Skeletonizer(
                      child: Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColorsDark.primaryColor.withValues(
                            alpha: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    Skeletonizer(
                      child: Container(
                        height: 220.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColorsDark.primaryColor.withValues(
                            alpha: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    Skeletonizer(
                      child: Container(
                        height: 35.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColorsDark.primaryColor.withValues(
                            alpha: .3,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Small poster grid skeleton
                    Skeletonizer(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8.h,
                          crossAxisSpacing: 8.w,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColorsDark.primaryColor.withValues(
                                alpha: 0.3,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }

              // ------------------------ Error State ------------------------
              if (state is MoviesError) {
                return Center(child: Text(state.message));
              }

              // ------------------------ Loaded State ------------------------
              if (state is MoviesLoaded && state.movies != null) {
                final movies = state.movies!;

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
                            onTap: () =>
                                showToast("Search feature coming soon!"),
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
                          final crossAxisCount = responsiveGridCount(
                            constraints,
                          );

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
      ),
    );
  }
}
