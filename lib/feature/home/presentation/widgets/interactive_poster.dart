import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';

class InteractivePoster extends StatefulWidget {
  final String? imagePath;
  final String? mediaType; // "movie" or "tv"
  final double width;
  final double height;
  final double borderRadius;
  final int? itemId;
  final String? bottomText;
  final VoidCallback? onTap;

  const InteractivePoster({
    super.key,
    this.imagePath,
    this.mediaType,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.itemId,
    this.bottomText,
    this.onTap,
  });

  @override
  State<InteractivePoster> createState() => _InteractivePosterState();
}

class _InteractivePosterState extends State<InteractivePoster>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  bool _isHovered = false;
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  void _handleTap() {
    HapticFeedback.lightImpact();
    if (widget.onTap != null) {
      widget.onTap!();
    } else if (widget.itemId != null && widget.mediaType != null) {
      final route = widget.mediaType == "movie"
          ? '/movie/${widget.itemId}'
          : '/tvSeriesDetails/${widget.itemId}';
      context.push(route);
    } else {
      showToast("Details coming soon!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: _handleTap,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: EdgeInsets.only(right: 12.w),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: _isPressed || _isHovered
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image:
                        widget.imagePath != null && widget.imagePath!.isNotEmpty
                        ? (widget.imagePath!.startsWith('http')
                              ? NetworkImage(widget.imagePath!)
                              : NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${widget.imagePath}',
                                ))
                        : const AssetImage('assets/images/avengers.png')
                              as ImageProvider,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 300),
                    placeholderErrorBuilder: (context, error, stackTrace) {
                      return _buildShimmerPlaceholder();
                    },
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/avengers.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  if (_isPressed)
                    Container(color: Colors.black.withValues(alpha: 0.1)),
                  if (widget.bottomText != null)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.6),
                            ],
                          ),
                        ),
                        child: Text(
                          widget.bottomText!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  if (widget.mediaType != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: widget.mediaType == "movie"
                              ? Colors.redAccent
                              : Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.mediaType!.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerPlaceholder() {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: [
                (_shimmerController.value - 0.3).clamp(0.0, 1.0),
                _shimmerController.value.clamp(0.0, 1.0),
                (_shimmerController.value + 0.3).clamp(0.0, 1.0),
              ],
              begin: const Alignment(-1, -0.3),
              end: const Alignment(1, 0.3),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.movie,
              color: Colors.grey.shade400.withValues(alpha: 0.6),
              size: 40,
            ),
          ),
        );
      },
    );
  }
}

final Uint8List kTransparentImage = Uint8List.fromList([
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
