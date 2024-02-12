import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/services.dart';
import 'package:shipsy_assignment/core/api/api_client.dart';
import 'package:shipsy_assignment/models/movie_clip_model/movie_clip_model.dart';
import 'package:shipsy_assignment/models/movie_detail_model/movie_detail_model.dart';
import 'package:shipsy_assignment/models/movie_images_model/movie_images_model.dart';
import 'package:shipsy_assignment/models/movie_locations_model/movie_locations_model.dart';
import 'package:shipsy_assignment/models/movie_seats_model/movie_seats_model.dart';
import 'package:shipsy_assignment/models/movie_tickets_model/movie_tickets_model.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_movies_model.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';
import 'package:shipsy_assignment/utils/constants/paths/json_data_path.dart';

class ClientApiService {
  // final _restApiClient = getIt<RestApiClient>();
  // final _apiUrl = getIt<RestAPIRequestPath>();

  ClientApiService();

  Future<Map<String, dynamic>> _readJson(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    return data;
  }

  Future<UpcomingMoviesModel?> getUpComingMovies(int pageNumber) async {
    try {
      // final query = {"page": pageNumber};

      // final result = await _restApiClient.get(
      //   _apiUrl.upcomingMovies(),
      //   queryParameters: query,
      // );
      final result = await _readJson(JsonDataPath.upcomingMovie);
      return UpcomingMoviesModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieDetailModel?> getMovieDetail(int movieId) async {
    try {
      // final result = await _restApiClient.get(
      //   _apiUrl.movieDetail(movieId),
      // );
      // log(result.toString(), name: "movieDetail");
      final result = await _readJson(JsonDataPath.movieDetail);

      return MovieDetailModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieImagesModel?> getMovieImages(int movieId) async {
    try {
      // final result = await _restApiClient.get(
      //   _apiUrl.movieDetail(movieId),
      // );
      // log(result.toString(), name: "movieDetail");
      final result = await _readJson(JsonDataPath.movieImages);

      return MovieImagesModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieClipModel?> getMovieClip(int movieId) async {
    try {
      // final result = await _restApiClient.get(
      //   _apiUrl.movieClip(movieId),
      // );
      // log(result.toString(), name: "movieClip");

      final result = await _readJson(JsonDataPath.movieClip);

      return MovieClipModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieLocationsModel?> getMovieLocation(int movieId) async {
    try {
      // final result = await _restApiClient.get(
      //   _apiUrl.movieClip(movieId),
      // );
      // log(result.toString(), name: "movieClip");

      final result = await _readJson(JsonDataPath.movieLocations);

      return MovieLocationsModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieSeatsModel?> getMovieSeats(int movieId, String locationId) async {
    try {
      // final result = await _restApiClient.get(
      //   _apiUrl.movieClip(movieId),
      // );
      // log(result.toString(), name: "movieClip");

      final result = await _readJson(JsonDataPath.movieSeats);

      return MovieSeatsModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }

  Future<MovieTicketsModel?> getUserTickets() async {
    try {
      // final result = await _restApiClient.get(
      //   _apiUrl.movieClip(movieId),
      // );
      // log(result.toString(), name: "movieClip");

      final result = await _readJson(JsonDataPath.movieTickets);

      return MovieTicketsModel.fromJson(result);
    } on DioException catch (e) {
      appLogger.e(e);
      throw e.apiError;
    }
  }
}
