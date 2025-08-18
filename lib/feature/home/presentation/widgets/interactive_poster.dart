import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class InteractivePoster extends StatefulWidget {
  final String? imagePath;
  final double width;
  final double height;
  final double borderRadius;
  final int? movieId;
  final VoidCallback? onTap;

  const InteractivePoster({
    super.key,
    this.imagePath,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.movieId,
    this.onTap,
  });

  @override
  State<InteractivePoster> createState() => _InteractivePosterState();
}

class _InteractivePosterState extends State<InteractivePoster> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    // التعامل مع الـ API
    if (widget.imagePath != null && widget.imagePath!.isNotEmpty) {
      final path = widget.imagePath!.startsWith('/')
          ? 'https://image.tmdb.org/t/p/w500${widget.imagePath}'
          : widget.imagePath!;
      imageProvider = NetworkImage(path);
    } else {
      imageProvider = const AssetImage('assets/images/avengers.png');
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        HapticFeedback.lightImpact();
        if (widget.onTap != null) {
          widget.onTap!();
        } else if (widget.movieId != null) {
          context.push('/movie/${widget.movieId}');
        } else {
          showToast("Movie details coming soon!");
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.only(right: 12.w),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: AppColorsDark.primaryColor.withOpacity(.5),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColorsDark.primaryColor.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
        ),
        child: Transform.scale(
          scale: _isPressed ? 0.97 : 1.0,
          child: Container(),
        ),
      ),
    );
  }
}
