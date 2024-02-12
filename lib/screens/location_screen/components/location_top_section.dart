import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_location/movie_location_bloc.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';

class LocationTopSection extends StatefulWidget {
  const LocationTopSection({
    super.key,
    required this.selectedIndex,
    required this.callback,
  });

  final int selectedIndex;
  final void Function(int index) callback;

  @override
  State<LocationTopSection> createState() => _LocationTopSectionState();
}

class _LocationTopSectionState extends State<LocationTopSection> {
  @override
  Widget build(BuildContext context) {
    final movieLocation = context.watch<MovieLocationBloc>();
    final movieLocationsModel = movieLocation.state.movieLocationsModel;
    final locations = movieLocationsModel?.location ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Locations",
          style: context.constantUi.headingTextStyle1,
        ).paddingAll(10),
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.constantUi.blackLightColor,
            ),
          ),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final curLocation = locations[index];
              return InkWell(
                onTap: () {
                  widget.callback(index);
                },
                child: Container(
                  width: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: double.maxFinite,
                  color: widget.selectedIndex == index
                      ? context.constantUi.primaryColor
                      : context.constantUi.whiteColor,
                  child: Center(
                    child: Text(
                      curLocation.locationName ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: widget.selectedIndex == index
                            ? context.constantUi.whiteColor
                            : context.constantUi.blackColor,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const VerticalDivider(
              width: 1,
              thickness: 1,
            ),
            itemCount: locations.length,
          ),
        ),
      ],
    );
  }
}
