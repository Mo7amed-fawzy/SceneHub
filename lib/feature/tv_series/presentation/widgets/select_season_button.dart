import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/bloc/tv_series_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class SelectSeasonButton extends StatefulWidget {
  SelectSeasonButton({
    super.key,
    required this.seasonNumber,
    required this.tvSeriesId,
    required this.numberOfSeasons,
  });

  int seasonNumber;
  final int tvSeriesId;
  final int numberOfSeasons;

  @override
  State<SelectSeasonButton> createState() => _SelectSeasonButtonState();
}

class _SelectSeasonButtonState extends State<SelectSeasonButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Season ${widget.seasonNumber}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12.w,
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            final tvSeriesBloc = BlocProvider.of<TvSeriesBloc>(context);
            showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  backgroundColor: const Color(0xFF252836),
                  content: SizedBox(
                    width: 327.w,
                    height: 351.h,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      itemCount: widget.numberOfSeasons,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: GestureDetector(
                              child: Text(
                                'Season ${index + 1}',
                                style: widget.seasonNumber == index + 1
                                    ? TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.12.w,
                                      )
                                    : TextStyle(
                                        color: const Color(0xFF696974),
                                        fontSize: 20.sp,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.12.w,
                                      ),
                              ),
                              onTap: () {
                                widget.seasonNumber = index + 1;
                                setState(() {});
                                tvSeriesBloc.add(
                                  FetchTvSeriesSeasonDetails(
                                    id: widget.tvSeriesId,
                                    seasonNumber: widget.seasonNumber,
                                  ),
                                );
                                Navigator.pop(dialogContext);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: SvgPicture.asset(
            AppStyle.icons.downArrow,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
