import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_item_model.dart';
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Release on: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(releaseDate),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Adult: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                    onPressed: () {},
                    style: context.constantUi.elevatedButtonStyleOne,
                    child: Text(
                      "Book",
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
