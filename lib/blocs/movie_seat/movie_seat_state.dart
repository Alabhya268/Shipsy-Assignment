// ignore_for_file: overridden_fields

part of 'movie_seat_bloc.dart';

sealed class MovieSeatState {
  List<Seat>? seats = [];
}

final class MovieSeatInitial extends MovieSeatState {}

final class MovieSeatFetchedState extends MovieSeatState {
  MovieSeatFetchedState({required this.seats});

  @override
  final List<Seat>? seats;
}

final class MovieSeatLoadingState extends MovieSeatState {}

final class MovieSeatErrorState extends MovieSeatState {}
