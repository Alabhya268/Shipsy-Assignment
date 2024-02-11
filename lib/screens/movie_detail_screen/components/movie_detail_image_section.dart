import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';

class MovieDetailImageSection extends StatefulWidget {
  const MovieDetailImageSection({
    super.key,
  });

  @override
  State<MovieDetailImageSection> createState() =>
      _MovieDetailImageSectionState();
}

class _MovieDetailImageSectionState extends State<MovieDetailImageSection> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailBloc>();
    final curimages = movieDetails.state.movieImagesModel;
    List<String?> movieImages = curimages?.posters
            ?.map((element) => element.filePath?.toMovieImagePath)
            .toList() ??
        [];
    movieImages =
        movieImages.length > 5 ? movieImages.sublist(0, 5) : movieImages;
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: movieImages.length,
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: movieImages[index] ?? "",
              errorWidget: (context, error, stack) => Container(),
              fit: BoxFit.cover,
            ),
          ),
          mDPageIndicator(context, movieImages),
        ],
      ),
    );
  }

  Positioned mDPageIndicator(BuildContext context, List<String?> movieImages) {
    return Positioned(
      bottom: 5,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 10,
          width: context.mediaWidth,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < (movieImages.length); i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: i == currentPage
                            ? context.constantUi.primaryColor
                            : context.constantUi.whiteColor,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                      color: i == currentPage
                          ? context.constantUi.primaryColor
                          : context.constantUi.whiteColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
