import 'package:ai_movie_app/feature/movies/domain/entities/movies_details_entity.dart';
import 'package:ai_movie_app/feature/movies/presentation/screens/movies_details_show.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/movies_bloc.dart';

class MoviesDetailsScreen extends StatefulWidget {
  const MoviesDetailsScreen({super.key, required this.movieId});
  final int movieId;

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  @override
  void initState() {
    context.read<MoviesBloc>().add(FetchMovieDetailsEvent(widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoaded) {
            return MoviesDetailsShow(
              moviesDetails: state.movieDetails,
              movieId: widget.movieId,
            );
          }
          if (state is MoviesDetailsLoading) {
            return MoviesDetailsShow(
              moviesDetails: const MoviesDetailsEntity(
                backdropPath: 'dsfgfdg',
                id: 0,
                title: 'sdgsdfsdgsdf',
                overview:
                    'sdgsdfskld sdklgsiod h;gsiodgjf sdoipgj; sidgj siodgjsdoi;g ',
                releaseDate: null,
                voteAverage: 0.0,
                runtime: 120,
                genres: [],
                posterPath: 'dsfgfdg',
              ),
              movieId: widget.movieId,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
