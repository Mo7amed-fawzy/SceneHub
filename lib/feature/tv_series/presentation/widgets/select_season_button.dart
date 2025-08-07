import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
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
  late int currentSeasonNumber;

  @override
  void initState() {
    super.initState();
    currentSeasonNumber = widget.seasonNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Season $currentSeasonNumber',
          textAlign: TextAlign.center,
          style: CustomTextStyles.montserrat500style14.copyWith(
            color: Colors.white,
            letterSpacing: 0.12.w,
          ),
        ),
        5.horizontalSpace,
        GestureDetector(
          onTap: () async {
            final tvSeriesBloc = BlocProvider.of<TvSeriesBloc>(context);
            final result = await showDialog<int>(
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
                                style: currentSeasonNumber == index + 1
                                    ? CustomTextStyles.montserrat600style24
                                          .copyWith(
                                            color: Colors.white,
                                            letterSpacing: 0.12.w,
                                          )
                                    : CustomTextStyles.montserrat600style20
                                          .copyWith(
                                            color: const Color(0xFF696974),
                                          ),
                              ),
                              onTap: () {
                                Navigator.pop(dialogContext, index + 1);
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

            if (result != null && result != currentSeasonNumber) {
              setState(() {
                currentSeasonNumber = result;
              });
              tvSeriesBloc.add(
                FetchTvSeriesSeasonDetails(
                  id: widget.tvSeriesId,
                  seasonNumber: currentSeasonNumber,
                ),
              );
            }
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
