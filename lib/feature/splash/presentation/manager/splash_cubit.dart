import 'package:ai_movie_app/feature/splash/domain/use_case/decide_start_destination_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final DecideStartDestinationUseCase useCase;

  SplashCubit(this.useCase) : super(SplashInitial());

  Future<void> decideRoute() async {
    emit(SplashLoading());
    final route = await useCase();
    emit(SplashNavigation(route));
  }
}
