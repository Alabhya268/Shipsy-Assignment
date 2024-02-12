import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/upcoming_movie/upcoming_movies_bloc.dart';
import 'package:shipsy_assignment/screens/home_screen/components/movie_grid_item.dart';
import 'package:shipsy_assignment/utils/app_error.dart';

class UpComingMoviesTab extends StatefulWidget {
  const UpComingMoviesTab({
    super.key,
  });

  @override
  State<UpComingMoviesTab> createState() => _UpComingMoviesTabState();
}

class _UpComingMoviesTabState extends State<UpComingMoviesTab> {
  ScrollController sc = ScrollController();
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getUpcomingMovies();
    });
  }

  Future<void> getUpcomingMovies() async {
    try {
      final upcomingMovies = context.read<UpComingMoviesBloc>();
      upcomingMovies.add(FetchMoviesEvent(pageNumber: pageNumber));
    } catch (e, s) {
      reportError.handleAppError(e, s);
    }
  }

  Widget bodyType() {
    final upcomingMovies = context.watch<UpComingMoviesBloc>();
    switch (upcomingMovies.state.runtimeType) {
      case (UpComingMoviesErrorState):
        {
          return const Center(
            child: Text("Oops! Something went  wrong"),
          );
        }
      case (UpComingMoviesFetchedState):
        {
          return Center(
            child: sucessWidget(),
          );
        }
      case (UpComingMoviesLoadingState):
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return bodyType();
  }

  Widget sucessWidget() {
    final upcomingMovies = context.watch<UpComingMoviesBloc>();
    final movieList = upcomingMovies.state.movieList;
    return movieList.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            itemCount: movieList.length,
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) => Builder(builder: (context) {
              movieList[index];

              return MovieGridItem(upcomingItemModel: movieList[index]);
            }),
          )
        : const Center(
            child: Text("No movies available"),
          );
  }
}
