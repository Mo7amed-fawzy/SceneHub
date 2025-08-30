import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/communication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scenebot_cubit.dart';

class ChatBubbleMulti extends StatelessWidget {
  final Message message;

  const ChatBubbleMulti({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScenebotCubit>();
    final isUser = message.sender == Sender.user;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 0.7.sw),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: isUser
                  ? AppColorsDark.selectedIcon
                  : AppColorsDark.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(isUser ? 20.r : 0),
                bottomRight: Radius.circular(isUser ? 0 : 20.r),
              ),
            ),
            child: Text(
              message.text,
              style: isUser
                  ? CustomTextStyles.poppins400style16.copyWith(
                      color: Colors.white,
                    )
                  : CustomTextStyles.poppins400style16.copyWith(
                      color: AppColorsDark.text,
                    ),
            ),
          ),
          if (!isUser &&
              message.suggestions != null &&
              message.suggestions!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Wrap(
                spacing: 6.w,
                runSpacing: 6.h,
                children: message.suggestions!.map((s) {
                  final isSelected = cubit.selectedSuggestions.contains(
                    s,
                  ); // من الكيوبت
                  return GestureDetector(
                    onTap: () {
                      cubit.toggleSuggestion(s);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColorsDark.selectedIcon
                            : AppColorsDark.selectedIcon.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        s,
                        style: CustomTextStyles.poppins400style14.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColorsDark.selectedIcon,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
