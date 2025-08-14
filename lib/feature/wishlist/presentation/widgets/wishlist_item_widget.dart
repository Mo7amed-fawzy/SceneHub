import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/wishlist/domain/entities/wishlist_item.dart';

class WishlistItemWidget extends StatelessWidget {
  final WishlistItem wishlistItem;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;

  const WishlistItemWidget({
    Key? key,
    required this.wishlistItem,
    this.onRemove,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Movie Poster
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: SizedBox(
                width: 80,
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: _getImageUrl(wishlistItem.movie.posterPath),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie, size: 40),
                  ),
                ),
              ),
            ),

            // Movie Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wishlistItem.movie.title,
                      style: CustomTextStyles.montserrat600style16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber[600]),
                        const SizedBox(width: 4),
                        Text(
                          wishlistItem.movie.voteAverage.toStringAsFixed(1),
                          style: CustomTextStyles.poppins400style12.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Release Date
                    if (wishlistItem.movie.releaseDate.isNotEmpty)
                      Text(
                        wishlistItem.movie.releaseDate,
                        style: CustomTextStyles.poppins400style12.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),

                    const SizedBox(height: 4),

                    // Genres
                    if (wishlistItem.movie.genres.isNotEmpty)
                      Text(
                        wishlistItem.movie.genres.take(2).join(', '),
                        style: CustomTextStyles.poppins400style12.copyWith(
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    const SizedBox(height: 8),

                    // Added Date
                    Text(
                      'Added ${_formatDate(wishlistItem.addedAt)}',
                      style: CustomTextStyles.poppins400style12.copyWith(
                        color: Colors.grey[500],
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Remove Button
            if (onRemove != null)
              IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.favorite,
                  color: AppColorsDark.selectedIcon,
                  size: 24,
                ),
                tooltip: 'Remove from wishlist',
              ),
          ],
        ),
      ),
    );
  }

  String _getImageUrl(String posterPath) {
    if (posterPath.isEmpty) {
      return 'https://via.placeholder.com/80x120?text=No+Image';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'today';
    } else if (difference.inDays == 1) {
      return 'yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
