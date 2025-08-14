import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart' as toast;
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_event.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/widgets/wishlist_item_widget.dart';

class WishlistView extends StatefulWidget {
  final String userId;

  const WishlistView({Key? key, required this.userId}) : super(key: key);

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().add(LoadWishlist(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColorsDark.primaryColor,
        elevation: 0,
        title: Text(
          'My Wishlist',
          style: CustomTextStyles.montserrat600style16.copyWith(
            color: AppColorsDark.text,
          ),
        ),
        actions: [
          BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, state) {
              if (state is WishlistLoaded && state.wishlistItems.isNotEmpty) {
                return IconButton(
                  onPressed: () => _showClearWishlistDialog(context),
                  icon: const Icon(Icons.delete_sweep, color: Colors.white),
                  tooltip: 'Clear wishlist',
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<WishlistCubit>().add(
            RefreshWishlist(userId: widget.userId),
          );
        },
        child: BlocConsumer<WishlistCubit, WishlistState>(
          listener: (context, state) {
            if (state is AddToWishlistSuccess) {
              toast.showToast('Added to wishlist!', Colors.green);
            } else if (state is AddToWishlistError) {
              toast.showToast(state.message, Colors.red);
            } else if (state is RemoveFromWishlistSuccess) {
              toast.showToast('Removed from wishlist', Colors.orange);
            } else if (state is RemoveFromWishlistError) {
              toast.showToast(state.message, Colors.red);
            } else if (state is ClearWishlistSuccess) {
              toast.showToast('Wishlist cleared', Colors.blue);
            } else if (state is ClearWishlistError) {
              toast.showToast(state.message, Colors.red);
            }
          },
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else if (state is WishlistError) {
              return _buildErrorWidget(state.message);
            } else if (state is WishlistEmpty) {
              return _buildEmptyWidget();
            } else if (state is WishlistLoaded) {
              return _buildWishlistContent(state);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWishlistContent(WishlistLoaded state) {
    return Column(
      children: [
        // Header with count
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.favorite, color: AppColorsDark.selectedIcon, size: 24),
              const SizedBox(width: 8),
              Text(
                '${state.count} ${state.count == 1 ? 'movie' : 'movies'} in your wishlist',
                style: CustomTextStyles.poppins500style14.copyWith(
                  color: AppColorsDark.text,
                ),
              ),
            ],
          ),
        ),

        // Wishlist items
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: state.wishlistItems.length,
            itemBuilder: (context, index) {
              final wishlistItem = state.wishlistItems[index];
              return WishlistItemWidget(
                wishlistItem: wishlistItem,
                onRemove: () => _removeFromWishlist(wishlistItem.movie.id),
                onTap: () => _onMovieTap(wishlistItem.movie),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: AppColorsDark.tertiaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: CustomTextStyles.montserrat600style16.copyWith(
              color: AppColorsDark.text,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start adding movies to your wishlist\nto see them here',
            style: CustomTextStyles.poppins400style14.copyWith(
              color: AppColorsDark.tertiaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to movies list
              Navigator.pop(context);
            },
            icon: const Icon(Icons.movie),
            label: const Text('Browse Movies'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsDark.selectedIcon,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: CustomTextStyles.montserrat600style16.copyWith(
              color: AppColorsDark.text,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: CustomTextStyles.poppins400style14.copyWith(
              color: AppColorsDark.tertiaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<WishlistCubit>().add(
                RefreshWishlist(userId: widget.userId),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsDark.selectedIcon,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeFromWishlist(String movieId) {
    context.read<WishlistCubit>().add(
      RemoveFromWishlist(movieId: movieId, userId: widget.userId),
    );
  }

  void _onMovieTap(dynamic movie) {
    // Navigate to movie details
    // This would be implemented based on your navigation structure
    toast.showToast('Movie details coming soon!', Colors.blue);
  }

  void _showClearWishlistDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColorsDark.secondaryColor,
          title: Text(
            'Clear Wishlist',
            style: CustomTextStyles.montserrat600style16.copyWith(
              color: AppColorsDark.text,
            ),
          ),
          content: Text(
            'Are you sure you want to remove all movies from your wishlist? This action cannot be undone.',
            style: CustomTextStyles.poppins400style14.copyWith(
              color: AppColorsDark.text,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: CustomTextStyles.poppins400style14.copyWith(
                  color: AppColorsDark.tertiaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<WishlistCubit>().add(
                  ClearWishlist(userId: widget.userId),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }
}
