part of 'movie_seat_bloc.dart';

sealed class MovieSeatEvent {}

class FetchMovieSeatEvent extends MovieSeatEvent {
  FetchMovieSeatEvent({required this.movieId, required this.locationName});

  final int movieId;
  final String locationName;
}
