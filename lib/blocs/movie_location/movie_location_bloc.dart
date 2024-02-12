import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shipsy_assignment/models/movie_locations_model/movie_locations_model.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:shipsy_assignment/services/injection_container.dart';

part 'movie_location_event.dart';
part 'movie_location_state.dart';

class MovieLocationBloc extends Bloc<MovieLocationEvent, MovieLocationState> {
  MovieLocationBloc() : super(MovieLocationInitial()) {
    on<FetchMovieLocationEvent>((event, emit) async {
      emit(MovieLocationLoadingState());
      try {
        await Future.delayed(
          const Duration(milliseconds: 500),
        );
        final data =
            await getIt<ClientApiService>().getMovieLocation(event.movieId);
        emit(
          MovieLocationFetchedState(movieLocationsModel: data),
        );
      } catch (e) {
        emit(MovieLocationErrorState());
        rethrow;
      }
    });
  }
}
