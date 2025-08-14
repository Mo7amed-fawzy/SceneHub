import 'package:ai_movie_app/feature/on_bourding/domain/use_cases/on_boarding_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/on_boarding_entity.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final GetOnBoardingDataUseCase getDataUseCase;
  final SetOnBoardingVisitedUseCase setVisitedUseCase;

  OnBoardingCubit(this.getDataUseCase, this.setVisitedUseCase)
    : super(OnBoardingInitial());

  void loadOnBoardingData() {
    final data = getDataUseCase();
    emit(OnBoardingLoaded(data));
  }

  Future<void> completeOnBoarding() async {
    await setVisitedUseCase();
    emit(OnBoardingCompleted());
  }
}
