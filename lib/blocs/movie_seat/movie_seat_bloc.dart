import 'package:bloc/bloc.dart';
import 'package:shipsy_assignment/models/movie_seats_model/seat.dart';
import 'package:shipsy_assignment/services/client_api_service.dart';
import 'package:shipsy_assignment/services/injection_container.dart';

part 'movie_seat_event.dart';
part 'movie_seat_state.dart';

class MovieSeatBloc extends Bloc<MovieSeatEvent, MovieSeatState> {
  MovieSeatBloc() : super(MovieSeatInitial()) {
    on<FetchMovieSeatEvent>((event, emit) async {
      emit(MovieSeatLoadingState());
      try {
        await Future.delayed(const Duration(milliseconds: 500));
        final data = await getIt<ClientApiService>().getMovieSeats(
          event.movieId,
          event.locationName,
        );

        emit(MovieSeatFetchedState(seats: data?.seats));
      } catch (e) {
        emit(MovieSeatErrorState());
        rethrow;
      }
    });
  }
}
