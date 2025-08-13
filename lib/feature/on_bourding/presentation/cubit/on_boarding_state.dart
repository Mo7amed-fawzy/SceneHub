part of 'on_boarding_cubit.dart';

abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final List<OnBoardingEntity> data;
  OnBoardingLoaded(this.data);
}

class OnBoardingCompleted extends OnBoardingState {}
