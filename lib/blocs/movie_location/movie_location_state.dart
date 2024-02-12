// ignore_for_file: overridden_fields

part of 'movie_location_bloc.dart';

sealed class MovieLocationState {
  MovieLocationsModel? movieLocationsModel;
}

final class MovieLocationInitial extends MovieLocationState {}

final class MovieLocationFetchedState extends MovieLocationState {
  MovieLocationFetchedState({required this.movieLocationsModel});

  @override
  final MovieLocationsModel? movieLocationsModel;
}

final class MovieLocationErrorState extends MovieLocationState {}

final class MovieLocationLoadingState extends MovieLocationState {}
