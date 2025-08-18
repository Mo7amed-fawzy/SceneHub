part of 'home_media_bloc.dart';

abstract class HomeMediaEvent {}

class GetDetailsEvent extends HomeMediaEvent {
  final int id;
  final String mediaType;

  GetDetailsEvent({required this.id, required this.mediaType});
}

class GetNowPlayingEvent extends HomeMediaEvent {
  final String mediaType;

  GetNowPlayingEvent(this.mediaType);
}

class GetMixedNowPlayingEvent extends HomeMediaEvent {}
