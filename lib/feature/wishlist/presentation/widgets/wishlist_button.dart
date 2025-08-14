import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_event.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_state.dart';

class WishlistButton extends StatefulWidget {
  final MovieModel movie;
  final String userId;
  final double? size;
  final Color? color;
  final bool showTooltip;

  const WishlistButton({
    Key? key,
    required this.movie,
    required this.userId,
    this.size,
    this.color,
    this.showTooltip = true,
  }) : super(key: key);

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  bool _isInWishlist = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkWishlistStatus();
  }

  void _checkWishlistStatus() {
    context.read<WishlistCubit>().add(
      CheckWishlistStatus(movieId: widget.movie.id, userId: widget.userId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is CheckWishlistStatusSuccess) {
          setState(() {
            _isInWishlist = state.isInWishlist;
            _isLoading = false;
          });
        } else if (state is CheckWishlistStatusLoading) {
          setState(() {
            _isLoading = true;
          });
        } else if (state is AddToWishlistSuccess) {
          setState(() {
            _isInWishlist = true;
            _isLoading = false;
          });
        } else if (state is RemoveFromWishlistSuccess) {
          setState(() {
            _isInWishlist = false;
            _isLoading = false;
          });
        }
      },
      child: IconButton(
        onPressed: _isLoading ? null : _toggleWishlist,
        icon: _buildIcon(),
        tooltip: widget.showTooltip ? _getTooltip() : null,
        color: widget.color ?? AppColorsDark.selectedIcon,
        iconSize: widget.size ?? 24,
      ),
    );
  }

  Widget _buildIcon() {
    if (_isLoading) {
      return SizedBox(
        width: widget.size ?? 24,
        height: widget.size ?? 24,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    return Icon(
      _isInWishlist ? Icons.favorite : Icons.favorite_border,
      color: _isInWishlist ? AppColorsDark.selectedIcon : Colors.white,
    );
  }

  String _getTooltip() {
    return _isInWishlist ? 'Remove from wishlist' : 'Add to wishlist';
  }

  void _toggleWishlist() {
    if (_isInWishlist) {
      context.read<WishlistCubit>().add(
        RemoveFromWishlist(movieId: widget.movie.id, userId: widget.userId),
      );
    } else {
      context.read<WishlistCubit>().add(
        AddToWishlist(movie: widget.movie, userId: widget.userId),
      );
    }
  }
}
