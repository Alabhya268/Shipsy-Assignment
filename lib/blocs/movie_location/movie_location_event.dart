part of 'movie_location_bloc.dart';

@immutable
sealed class MovieLocationEvent {}

class FetchMovieLocationEvent extends MovieLocationEvent {
  FetchMovieLocationEvent({required this.movieId});

  final int movieId;
}
