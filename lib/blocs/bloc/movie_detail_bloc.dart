import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_item_model.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:shipsy_assignment/services/injection_container.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MoviesFetched>(
      (event, emit) async {
        try {
          final data = await getIt<ClientApiService>().getUpComingMovies();
          state.movieList.addAll(data?.results ?? []);
          emit(MovieDetailFetched(movieList: state.movieList));
        } catch (e) {
          appLogger.e(e);
        }
      },
    );
  }
}
