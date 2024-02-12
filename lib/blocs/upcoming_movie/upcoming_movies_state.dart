// ignore_for_file: overridden_fields

part of 'upcoming_movies_bloc.dart';

sealed class UpComingMoviesState {
  UpComingMoviesState();

  List<UpcomingItemModel> movieList = [];
}

final class UpComingMoviesInitial extends UpComingMoviesState {}

final class UpComingMoviesFetchedState extends UpComingMoviesState {
  UpComingMoviesFetchedState({required this.movieList});

  @override
  final List<UpcomingItemModel> movieList;
}

final class UpComingMoviesLoadingState extends UpComingMoviesState {}

final class UpComingMoviesErrorState extends UpComingMoviesState {}
