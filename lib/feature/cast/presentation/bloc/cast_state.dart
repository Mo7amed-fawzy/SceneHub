part of 'cast_bloc.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastLoaded extends CastState {
  final TvCastEntity tvCast;

  CastLoaded(this.tvCast);
}

final class CastError extends CastState {
  final String message;

  CastError(this.message);
}
