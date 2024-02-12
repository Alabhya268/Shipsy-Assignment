import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_location/movie_location_bloc.dart';
import 'package:shipsy_assignment/screens/location_screen/components/location_show_section.dart';
import 'package:shipsy_assignment/screens/location_screen/components/location_top_section.dart';
import 'package:shipsy_assignment/utils/app_error.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    super.key,
    required this.movieName,
    required this.movieid,
    required this.movieImg,
  });

  final String movieName;
  final String movieImg;
  final int? movieid;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, getMovieLocations);
  }

  Future<void> getMovieLocations() async {
    try {
      final movieLocation = context.read<MovieLocationBloc>();
      movieLocation.add(FetchMovieLocationEvent(movieId: 1));
    } catch (e, s) {
      reportError.handleAppError(e, s);
    }
  }

  Widget bodytype() {
    final movieLocation = context.watch<MovieLocationBloc>();
    switch (movieLocation.state.runtimeType) {
      case (MovieLocationFetchedState):
        {
          return successWidget();
        }
      case (MovieLocationErrorState):
        {
          return const Center(
            child: Text("Oops! Something went wrong"),
          );
        }
      case (MovieLocationLoadingState):
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieName),
      ),
      body: bodytype(),
    );
  }

  ListView successWidget() {
    return ListView(
      children: [
        LocationTopSection(
            selectedIndex: selectedIndex,
            callback: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
        const SizedBox(height: 15),
        LocationShowSection(
          selectedIndex: selectedIndex,
          movieName: widget.movieName,
          movieId: widget.movieid!,
          movieImg: widget.movieImg,
        )
      ],
    );
  }
}
