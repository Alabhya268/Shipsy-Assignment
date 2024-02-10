part of 'movie_detail_bloc.dart';

sealed class MovieDetailState {
  MovieDetailState();

  List<UpcomingItemModel> movieList = [];
}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailFetched extends MovieDetailState {
  MovieDetailFetched({required this.movieList});

  @override
  final List<UpcomingItemModel> movieList;
}
