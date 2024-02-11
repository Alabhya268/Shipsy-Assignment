part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpComingMoviesEvent {}

final class FetchMovies extends UpComingMoviesEvent {
  final int pageNumber;

  FetchMovies({required this.pageNumber});
}
