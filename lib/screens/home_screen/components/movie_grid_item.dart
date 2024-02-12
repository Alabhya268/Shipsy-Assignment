import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_item_model.dart';
import 'package:shipsy_assignment/screens/location_screen/location_screen.dart';
import 'package:shipsy_assignment/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:shipsy_assignment/services/injection_container.dart';
import 'package:shipsy_assignment/utils/constants/paths/api_path.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({
    super.key,
    required this.upcomingItemModel,
  });

  final UpcomingItemModel upcomingItemModel;

  @override
  Widget build(BuildContext context) {
    final curMovie = upcomingItemModel;
    final movieId = curMovie.id;
    final name = curMovie.originalTitle ?? "";
    final releaseDate = curMovie.releaseDate ?? "";
    final adult = curMovie.adult ?? false ? "Yes" : "No";
    final image =
        getIt<RestAPIRequestPath>().movieImage(curMovie.backdropPath ?? "");

    void bookNowOnTap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            movieName: name,
            movieid: movieId,
            movieImg: image,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              moviename: name,
              movieId: movieId!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: double.maxFinite,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    errorWidget: (context, e, w) => Container(),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: context.constantUi.boldTextStyle,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Release on: ",
                          style: context.constantUi.boldTextStyle,
                        ),
                        Text(releaseDate),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Adult: ",
                          style: context.constantUi.boldTextStyle,
                        ),
                        Text(adult),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ).paddingSymmetric(
                  horizontal: 10,
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: bookNowOnTap,
                    style: context.constantUi.elevatedButtonStyleOne,
                    child: Text(
                      "Book Now",
                      style: TextStyle(color: context.constantUi.whiteColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
