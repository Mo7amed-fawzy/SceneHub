import 'package:ai_movie_app/feature/search/domain/usecases/search_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    on<PerformSearch>((event, emit) async {
      emit(SearchLoading());
      final searchResults = await searchUseCase(event.query);
      searchResults.fold(
        (failure) => emit(SearchError(failure.message)),
        (results) => emit(SearchLoaded(results)),
      );
    });
  }
}
