import 'dart:ui';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';

class HomeNavBarShell extends StatefulWidget {
  final Widget child;
  const HomeNavBarShell({super.key, required this.child});

  @override
  State<HomeNavBarShell> createState() => _HomeNavBarShellState();
}

class _HomeNavBarShellState extends State<HomeNavBarShell>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<String> tabs = [
    '/',
    '/${AppStrings.search}',
    '/${AppStrings.watchlist}',
    '/${AppStrings.profile}',
    '/${AppStrings.settings}',
  ];

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.bookmark_outline,
    Icons.person_outline,
    Icons.settings_outlined,
  ];

  final List<IconData> activeIcons = [
    Icons.home,
    Icons.search,
    Icons.bookmark,
    Icons.person,
    Icons.settings,
  ];

  final List<String> labels = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.watchlist,
    AppStrings.profile,
    AppStrings.settings,
  ];

  @override
  Widget build(BuildContext context) {
    final routerIndex = tabs.indexWhere(
      (path) => GoRouterState.of(context).uri.toString() == path,
    );

    if (routerIndex != -1 && routerIndex != _currentIndex) {
      _currentIndex = routerIndex;
    }

    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: SafeArea(child: widget.child),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColorsDark.primaryColor.withValues(alpha: 0.08),
                    AppColorsDark.primaryColor.withValues(alpha: 0.02),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: AppColorsDark.primaryColor.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: AppColorsDark.selectedIcon,
                unselectedItemColor: AppColorsDark.hashedText,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: (index) {
                  HapticFeedback.lightImpact();
                  setState(() {
                    _currentIndex = index;
                  });
                  context.go(tabs[index]);
                },
                items: List.generate(tabs.length, (index) {
                  final isSelected = index == _currentIndex;

                  return BottomNavigationBarItem(
                    icon: AnimatedScale(
                      scale: isSelected ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return isSelected
                              ? LinearGradient(
                                  colors: [
                                    AppColorsDark.selectedIcon,
                                    AppColorsDark.trailerButton,
                                  ],
                                ).createShader(bounds)
                              : LinearGradient(
                                  colors: [
                                    AppColorsDark.hashedText,
                                    AppColorsDark.hashedText,
                                  ],
                                ).createShader(bounds);
                        },
                        child: Icon(
                          isSelected ? activeIcons[index] : icons[index],
                          size: 26.sp,
                        ),
                      ),
                    ),
                    label: labels[index],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
