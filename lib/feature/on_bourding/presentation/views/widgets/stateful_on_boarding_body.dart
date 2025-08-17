import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class StatfulOnBoardingbody extends StatefulWidget {
  const StatfulOnBoardingbody({
    super.key,
    required this.numberpageIndexes,
    this.dotWidth = 12.0,
    this.dotHeight = 8.0,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
  });
  // دي ال general state
  // ودي كدا private property
  final int numberpageIndexes;

  final double dotWidth;
  final double dotHeight;
  final Color activeColor;
  final Color inactiveColor;

  @override
  StatfulOnBoardingbodyState createState() => StatfulOnBoardingbodyState();
}

class StatfulOnBoardingbodyState extends State<StatfulOnBoardingbody> {
  final PageController _pageController = PageController(); //اضيف انيميشن
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // دي البتخليني اسكرول يمين وشمال حسب الداتا العندي
          Expanded(
            child: PageView.builder(
              // لما بستدعي حاجة من ال general state بكتب widget.
              itemCount: widget.numberpageIndexes,
              onPageChanged: _onPageChanged, // دا بحدد بيه الصفحه الحاليه
              controller: _pageController, // بتمكني اضيف انيميشن بعدين فالريترن
              itemBuilder: (context, index) {
                return Column(
                  children: [Image.asset(AppStyle.images.onBoarding)],
                );
              },
            ),
          ),
          _buildPageIndicator(
            numberOfIndexes: widget.numberpageIndexes,
            dotWidth: widget.dotWidth,
            dotHeight: widget.dotHeight,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator({
    required int numberOfIndexes,
    required double dotWidth,
    required double dotHeight,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfIndexes, (currentIndex) {
        return Container(
          margin: const EdgeInsets.all(4),
          width: _currentPage == currentIndex ? dotWidth : (dotWidth - 4),
          height: dotHeight,
          decoration: BoxDecoration(
            color: _currentPage == currentIndex ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
