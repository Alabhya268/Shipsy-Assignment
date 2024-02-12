part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpComingMoviesEvent {}

final class FetchMoviesEvent extends UpComingMoviesEvent {
  final int pageNumber;

  FetchMoviesEvent({required this.pageNumber});
}
