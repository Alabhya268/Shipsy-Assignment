// ignore_for_file: overridden_fields

part of 'movie_detail_bloc.dart';

sealed class MovieDetailState {
  MovieDetailModel? movieDetail;

  MovieImagesModel? movieImagesModel;

  MovieClipModel? movieClipModel;
}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailFetchedState extends MovieDetailState {
  MovieDetailFetchedState({
    required this.movieDetail,
    required this.movieImagesModel,
    required this.movieClipModel,
  });

  @override
  final MovieDetailModel? movieDetail;

  @override
  final MovieImagesModel? movieImagesModel;

  @override
  final MovieClipModel? movieClipModel;
}

final class MovieDetailLoadingState extends MovieDetailState {}

final class MovieDetailErrorState extends MovieDetailState {}
