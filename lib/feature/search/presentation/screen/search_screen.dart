import 'package:ai_movie_app/feature/home/presentation/widgets/cards.dart';
import 'package:ai_movie_app/feature/search/data/models/search_model.dart';
import 'package:ai_movie_app/feature/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: SafeArea(
        child: BlocConsumer<SearchBloc, SearchState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (query) {
                      context.read<SearchBloc>().add(PerformSearch(query));
                    },
                  ),
                ),
                if (state is SearchLoading)
                  const Center(child: CircularProgressIndicator()),
                if (state is SearchLoaded)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.searchResults.results!.length,
                      itemBuilder: (context, index) {
                        final result = state.searchResults.results![index];
                        return interactiveSmallPoster(
                          result.profilePath ?? '',
                          result.id ?? 0,
                          result.knownFor.toString(),
                        );
                      },
                    ),
                  ),
                if (state is SearchError) Center(child: Text(state.message)),
              ],
            );
          },
        ),
      ),
    );
  }
}
