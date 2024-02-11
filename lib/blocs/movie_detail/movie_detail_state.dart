// ignore_for_file: overridden_fields

part of 'movie_detail_bloc.dart';

sealed class MovieDetailState {
  MovieDetailModel? movieDetail;

  MovieImagesModel? movieImagesModel;

  MovieClipModel? movieClipModel;
}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailFetched extends MovieDetailState {
  MovieDetailFetched({
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

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailError extends MovieDetailState {}
