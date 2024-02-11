import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:shipsy_assignment/models/movie_clip_model/movie_clip_model.dart';
import 'package:shipsy_assignment/models/movie_detail_model/movie_detail_model.dart';
import 'package:shipsy_assignment/models/movie_images_model/movie_images_model.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:shipsy_assignment/services/injection_container.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<FetchMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        emit(MovieDetailLoading());
        final movieData =
            await getIt<ClientApiService>().getMovieDetail(event.movieId);
        final movieImages =
            await getIt<ClientApiService>().getMovieImages(event.movieId);
        final movieClips =
            await getIt<ClientApiService>().getMovieClip(event.movieId);

        emit(MovieDetailFetched(
          movieDetail: movieData,
          movieImagesModel: movieImages,
          movieClipModel: movieClips,
        ));
      } catch (e) {
        appLogger.e(e);
        emit(MovieDetailError());
      }
    });
  }
}
