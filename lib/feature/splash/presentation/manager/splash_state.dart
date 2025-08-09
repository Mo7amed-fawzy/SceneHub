part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashNavigation extends SplashState {
  final String route;

  SplashNavigation(this.route);
}
