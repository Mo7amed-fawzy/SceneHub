part of 'home_media_bloc.dart';

abstract class HomeMediaState {}

class HomeMediaInitial extends HomeMediaState {}

class HomeMediaLoading extends HomeMediaState {}

class HomeMediaDetailsLoaded extends HomeMediaState {
  final HomeMediaEntity details;

  HomeMediaDetailsLoaded(this.details);
}

class HomeMediaListLoaded extends HomeMediaState {
  final List<HomeMediaEntity> mediaList;

  HomeMediaListLoaded(this.mediaList);
}

class HomeMediaError extends HomeMediaState {
  final String message;

  HomeMediaError(this.message);
}
