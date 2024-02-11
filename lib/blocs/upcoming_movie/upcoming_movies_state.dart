// ignore_for_file: overridden_fields

part of 'upcoming_movies_bloc.dart';

sealed class UpComingMoviesState {
  UpComingMoviesState();

  List<UpcomingItemModel> movieList = [];
}

final class UpComingMoviesInitial extends UpComingMoviesState {}

final class UpComingMoviesFetched extends UpComingMoviesState {
  UpComingMoviesFetched({required this.movieList});

  @override
  final List<UpcomingItemModel> movieList;
}

final class UpComingMoviesLoading extends UpComingMoviesState {}

final class UpComingMoviesError extends UpComingMoviesState {}
