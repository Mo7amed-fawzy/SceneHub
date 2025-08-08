import 'package:ai_movie_app/feature/movies/data/models/movies_details_model.dart';
import 'package:ai_movie_app/feature/movies/presentation/screens/movies_details_show.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/movies_bloc.dart';

class MoviesDetailsScreen extends StatefulWidget {
  const MoviesDetailsScreen({super.key});

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  @override
  void initState() {
    context.read<MoviesBloc>().add(FetchMovieDetailsEvent(12));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoaded) {
            return MoviesDetailsShow(moviesDetails: state.movieDetails);
          }
          if (state is MoviesDetailsLoading) {
            return MoviesDetailsShow(
              moviesDetails: MoviesDetailsModel(
                backdropPath: 'dsfgfdg',
                id: 0,
                originalTitle: 'sdgsdfsdg',
                overview:
                    'sdgsdfskld sdklgsiod h;gsiodgjf sdoipgj; sidgj siodgjsdoi;g ',
                releaseDate: DateTime(2000),
                title: 'sdgsdfsdgsdf',
                voteAverage: 0.0,
                runtime: 120,
                genres: [],
                posterPath: 'dsfgfdg',
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
