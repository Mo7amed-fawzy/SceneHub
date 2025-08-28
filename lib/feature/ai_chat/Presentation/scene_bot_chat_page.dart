import 'package:ai_movie_app/feature/ai_chat/Presentation/widgets/ai_typing_indicator.dart';
import 'package:ai_movie_app/feature/ai_chat/Presentation/widgets/chat_bubble_multi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scenebot_cubit.dart';
import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scene_bot_state.dart';

class MovieSuggestionScreen extends StatelessWidget {
  const MovieSuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScenebotCubit>();

    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColorsDark.dialogBorder,
        title: Text('Scenebot AI', style: TextStyle(color: AppColorsDark.save)),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 'clear':
                  cubit.clearChat();
                  break;
                case 'select':
                  cubit.enterSelectionMode();
                  break;
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'clear', child: Text('Clear Chat')),
              PopupMenuItem(value: 'select', child: Text('Select Messages')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ScenebotCubit, ScenebotState>(
              builder: (context, state) {
                final messages = cubit.messages;
                final isTyping = state is ScenebotLoading;

                return ListView.builder(
                  controller: cubit.scrollController,
                  padding: EdgeInsets.all(12.w),
                  itemCount: messages.length + (isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < messages.length) {
                      final isSelected = cubit.selectedMessageIndexes.contains(
                        index,
                      );
                      return GestureDetector(
                        onLongPress: cubit.selectionMode
                            ? null
                            : () => cubit.enterSelectionMode(),
                        onTap: cubit.selectionMode
                            ? () => cubit.toggleMessageSelection(index)
                            : null,
                        child: Container(
                          color: isSelected
                              ? Colors.blue.withOpacity(0.3)
                              : Colors.transparent,
                          child: ChatBubbleMulti(message: messages[index]),
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AITypingIndicator(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cubit.queryController,
                    style: CustomTextStyles.poppins400style14,
                    decoration: InputDecoration(
                      hintText: 'Ask about a movie...',
                      hintStyle: CustomTextStyles.poppins400style12,
                      filled: true,
                      fillColor: AppColorsDark.secondaryColor,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: cubit.sendUserMessage,
                  child: CircleAvatar(
                    backgroundColor: AppColorsDark.selectedIcon,
                    radius: 26.r,
                    child: Icon(Icons.send, color: AppColorsDark.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
