part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

final class FetchMovieDetail extends MovieDetailEvent {
  final int movieId;

  FetchMovieDetail({required this.movieId});
}
