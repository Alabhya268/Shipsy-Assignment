import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shipsy_assignment/core/api/api_client.dart';
import 'package:shipsy_assignment/models/movie_clip_model/movie_clip_model.dart';
import 'package:shipsy_assignment/models/movie_detail_model/movie_detail_model.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_movies_model.dart';
import 'package:shipsy_assignment/services/injection_container.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';
import 'package:shipsy_assignment/utils/constants/api_path/api_path.dart';

class ClientApiService {
  final _restApiClient = getIt<RestApiClient>();
  final _apiUrl = getIt<RestAPIRequestPath>();

  ClientApiService();

  Future<UpcomingMoviesModel?> getUpComingMovies() async {
    try {
      final result = await _restApiClient.get(
        _apiUrl.upcomingMovies(),
      );

      // log(result.toString(), name: "upcomingMovies");
      return UpcomingMoviesModel.fromJson(result.data);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieDetailModel?> getMovieDetail(int movieId) async {
    try {
      final result = await _restApiClient.get(
        _apiUrl.movieDetail(movieId),
      );
      // log(result.toString(), name: "movieDetail");

      return MovieDetailModel.fromJson(result.data);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieClipModel?> getMovieClip(int movieId) async {
    try {
      final result = await _restApiClient.get(
        _apiUrl.movieClip(movieId),
      );
      // log(result.toString(), name: "movieClip");

      return MovieClipModel.fromJson(result.data);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }
}
