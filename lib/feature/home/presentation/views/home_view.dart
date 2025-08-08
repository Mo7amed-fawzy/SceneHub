import 'package:flutter/material.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/widgets/wishlist_button.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/views/wishlist_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.primaryColor,
      appBar: AppBar(
        title: Text(
          AppStrings.appName,
          style: CustomTextStyles.poppins600style18.copyWith(
            color: AppColorsDark.text,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToWishlist(context),
            icon: Icon(Icons.favorite, color: AppColorsDark.text),
            tooltip: 'My Wishlist',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to AI Movie App!',
              style: CustomTextStyles.montserrat600style16.copyWith(
                color: AppColorsDark.text,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'This is your home screen. You can browse movies and add them to your wishlist.',
              style: CustomTextStyles.poppins400style14.copyWith(
                color: AppColorsDark.tertiaryColor,
              ),
            ),
            const SizedBox(height: 32),

            // Example movie card with wishlist button
            _buildExampleMovieCard(context),

            const SizedBox(height: 24),

            // Navigation buttons
            _buildNavigationButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleMovieCard(BuildContext context) {
    final exampleMovie = MovieModel(
      id: '1',
      title: 'Example Movie',
      overview: 'This is an example movie to demonstrate the wishlist feature.',
      posterPath: '/example-poster.jpg',
      backdropPath: '/example-backdrop.jpg',
      voteAverage: 8.5,
      releaseDate: '2024-01-01',
      genres: ['Action', 'Adventure'],
      runtime: 120,
      status: 'Released',
    );

    return Card(
      color: AppColorsDark.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.movie, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exampleMovie.title,
                    style: CustomTextStyles.montserrat600style16.copyWith(
                      color: AppColorsDark.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    exampleMovie.overview,
                    style: CustomTextStyles.poppins400style12.copyWith(
                      color: AppColorsDark.tertiaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) => GetIt.instance<WishlistCubit>(),
              child: WishlistButton(
                movie: exampleMovie,
                userId: 'current-user-id', // Replace with actual user ID
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions:',
          style: CustomTextStyles.poppins500style14.copyWith(
            color: AppColorsDark.text,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton.icon(
              onPressed: () => _navigateToWishlist(context),
              icon: const Icon(Icons.favorite),
              label: const Text('View Wishlist'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorsDark.selectedIcon,
                foregroundColor: Colors.white,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _showComingSoon(context),
              icon: const Icon(Icons.movie),
              label: const Text('Browse Movies'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorsDark.secondaryColor,
                foregroundColor: AppColorsDark.text,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _navigateToWishlist(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => GetIt.instance<WishlistCubit>(),
          child: const WishlistView(
            userId: 'current-user-id',
          ), // Replace with actual user ID
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Movie browsing feature coming soon!'),
        backgroundColor: AppColorsDark.selectedIcon,
      ),
    );
  }
}
