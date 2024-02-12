part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

final class FetchMovieDetailEvent extends MovieDetailEvent {
  final int movieId;

  FetchMovieDetailEvent({required this.movieId});
}
