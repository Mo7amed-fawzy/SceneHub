import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InteractivePoster extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final double borderRadius;

  const InteractivePoster({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  State<InteractivePoster> createState() => _InteractivePosterState();
}

class _InteractivePosterState extends State<InteractivePoster> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        HapticFeedback.lightImpact();
        showToast("Movie details coming soon!");
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.only(right: 12.w),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: _isPressed
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 12,
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
        ),
        child: Transform.scale(
          scale: _isPressed ? 0.97 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: EdgeInsets.only(right: 12.w),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: _isPressed
                  ? [
                      BoxShadow(
                        color: AppColorsDark.primaryColor.withValues(alpha: .5),
                        offset: const Offset(0, 4),
                        blurRadius: 12,
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: AppColorsDark.primaryColor.withValues(
                          alpha: 0.2,
                        ),
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
