import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_location/movie_location_bloc.dart';
import 'package:shipsy_assignment/screens/seats_selection_screen/seat_selection_screen.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';
import 'package:shipsy_assignment/widgets/kv_string_widget.dart';

class LocationShowSection extends StatelessWidget {
  const LocationShowSection({
    super.key,
    required this.selectedIndex,
    required this.movieName,
    required this.movieImg,
    required this.movieId,
  });

  final int selectedIndex;
  final int movieId;
  final String movieName;
  final String movieImg;

  @override
  Widget build(BuildContext context) {
    final movieLocation = context.watch<MovieLocationBloc>();
    final movieLocationsModel = movieLocation.state.movieLocationsModel;
    final locationData = movieLocationsModel?.location?[selectedIndex];
    final shows = locationData?.shows ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shows",
          style: context.constantUi.headingTextStyle1,
        ).paddingAll(10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: shows.length,
          itemBuilder: (context, i) {
            final mallname = shows[i].mallName;
            final showDate = shows[i].date;
            final showTime = shows[i].time;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelectionScreen(
                      movieId: movieId,
                      name: movieName,
                      showData: shows[i],
                      movieImage: movieImg,
                      cityName: locationData?.locationName,
                    ),
                  ),
                );
              },
              child: Container(
                height: 80,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.constantUi.blackLightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KVStringWidget(keyString: "Mall Name: ", value: mallname),
                    KVStringWidget(keyString: "Show Date: ", value: showDate),
                    KVStringWidget(keyString: "Show Timw: ", value: showTime),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
