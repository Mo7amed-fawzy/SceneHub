import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/core/models/movie_model.dart';
import 'package:ai_movie_app/feature/wishlist/di/wishlist_injection.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/cubit/wishlist_event.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/views/wishlist_view.dart';
import 'package:ai_movie_app/feature/wishlist/presentation/widgets/wishlist_button.dart';

/// Example of how to integrate the wishlist feature into your main app
class WishlistIntegrationExample extends StatelessWidget {
  const WishlistIntegrationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Integration Example'),
        actions: [
          // Example: Wishlist button in app bar
          IconButton(
            onPressed: () => _navigateToWishlist(context),
            icon: const Icon(Icons.favorite),
            tooltip: 'My Wishlist',
          ),
        ],
      ),
      body: Column(
        children: [
          // Example: Movie card with wishlist button
          _buildMovieCard(context),

          const SizedBox(height: 20),

          // Example: Programmatic wishlist operations
          _buildWishlistOperations(context),
        ],
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context) {
    // Example movie data
    final movie = MovieModel(
      id: '1',
      title: 'Example Movie',
      overview: 'This is an example movie for demonstration purposes.',
      posterPath: '/example-poster.jpg',
      backdropPath: '/example-backdrop.jpg',
      voteAverage: 8.5,
      releaseDate: '2024-01-01',
      genres: ['Action', 'Adventure'],
      runtime: 120,
      status: 'Released',
    );

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Movie poster placeholder
            Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.movie, size: 30),
            ),

            const SizedBox(width: 16),

            // Movie details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Wishlist button
            WishlistButton(
              movie: movie,
              userId: 'current-user-id', // Replace with actual user ID
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWishlistOperations(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Programmatic Wishlist Operations:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Example buttons for different operations
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () => _loadWishlist(context),
                child: const Text('Load Wishlist'),
              ),
              ElevatedButton(
                onPressed: () => _addExampleMovie(context),
                child: const Text('Add Example Movie'),
              ),
              ElevatedButton(
                onPressed: () => _checkWishlistStatus(context),
                child: const Text('Check Status'),
              ),
              ElevatedButton(
                onPressed: () => _clearWishlist(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Clear Wishlist'),
              ),
            ],
          ),
        ],
      ),
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

  void _loadWishlist(BuildContext context) {
    final cubit = context.read<WishlistCubit>();
    cubit.add(
      LoadWishlist(userId: 'current-user-id'),
    ); // Replace with actual user ID
  }

  void _addExampleMovie(BuildContext context) {
    final movie = MovieModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Example Movie ${DateTime.now().hour}:${DateTime.now().minute}',
      overview: 'This is an example movie added at ${DateTime.now()}',
      posterPath: '/example-poster.jpg',
      backdropPath: '/example-backdrop.jpg',
      voteAverage: 7.5,
      releaseDate: '2024-01-01',
      genres: ['Example', 'Demo'],
      runtime: 90,
      status: 'Released',
    );

    final cubit = context.read<WishlistCubit>();
    cubit.add(
      AddToWishlist(
        movie: movie,
        userId: 'current-user-id', // Replace with actual user ID
      ),
    );
  }

  void _checkWishlistStatus(BuildContext context) {
    final cubit = context.read<WishlistCubit>();
    cubit.add(
      CheckWishlistStatus(
        movieId: '1',
        userId: 'current-user-id', // Replace with actual user ID
      ),
    );
  }

  void _clearWishlist(BuildContext context) {
    final cubit = context.read<WishlistCubit>();
    cubit.add(
      ClearWishlist(userId: 'current-user-id'),
    ); // Replace with actual user ID
  }
}

/// Example of how to initialize the wishlist feature in your main app
class WishlistInitializationExample {
  static Future<void> initializeWishlist() async {
    // Initialize wishlist dependencies
    await initWishlistDependencies();

    // Now you can use GetIt.instance<WishlistCubit>() anywhere in your app
    print('Wishlist feature initialized successfully!');
  }
}

/// Example of how to use the wishlist feature in a movie list
class MovieListWithWishlistExample extends StatelessWidget {
  final List<MovieModel> movies;
  final String userId;

  const MovieListWithWishlistExample({
    Key? key,
    required this.movies,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          leading: Container(
            width: 50,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.movie),
          ),
          title: Text(movie.title),
          subtitle: Text(
            movie.overview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: WishlistButton(movie: movie, userId: userId, size: 24),
        );
      },
    );
  }
}
