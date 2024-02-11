import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_item_model.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:shipsy_assignment/services/injection_container.dart';

import 'package:shipsy_assignment/utils/app_logger.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpComingMoviesBloc
    extends Bloc<UpComingMoviesEvent, UpComingMoviesState> {
  UpComingMoviesBloc() : super(UpComingMoviesInitial()) {
    on<FetchMovies>(moviesFetched);
  }

  void moviesFetched(FetchMovies event, emit) async {
    try {
      emit(UpComingMoviesError());
      final data =
          await getIt<ClientApiService>().getUpComingMovies(event.pageNumber);
      state.movieList.addAll(data?.results ?? []);
      emit(
        UpComingMoviesFetched(movieList: state.movieList),
      );
    } catch (e) {
      emit(UpComingMoviesError());
      appLogger.e(e);
    }
  }
}
