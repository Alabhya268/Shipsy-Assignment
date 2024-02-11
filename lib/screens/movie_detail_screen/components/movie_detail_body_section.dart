import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shipsy_assignment/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:shipsy_assignment/screens/movie_detail_screen/components/kv_string_widget.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailBodySection extends StatefulWidget {
  const MovieDetailBodySection({super.key, required this.playVideo});

  final void Function() playVideo;

  @override
  State<MovieDetailBodySection> createState() => _MovieDetailBodySectionState();
}

class _MovieDetailBodySectionState extends State<MovieDetailBodySection> {
  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailBloc>();
    final curDetail = movieDetails.state.movieDetail;
    final movieClip = movieDetails.state.movieClipModel?.results
            ?.firstWhere((element) =>
                element.type == "Trailer" && element.site == "YouTube")
            .key ??
        "";

    final name = curDetail?.title ?? "";
    final genres = curDetail?.genres?.map((e) => e.name).join(", ") ?? "";
    final releaseData = curDetail?.releaseDate;
    final overview = curDetail?.overview;
    final voteStars = (curDetail?.voteAverage ?? 0.0);

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (movieClip.isNotEmpty)
          ElevatedButton(
            style: context.constantUi.elevatedButtonStyleOne,
            onPressed: widget.playVideo,
            child: SizedBox(
              width: double.maxFinite,
              child: Center(
                child: Text(
                  "Watch Trailer",
                  style: TextStyle(color: context.constantUi.whiteColor),
                ),
              ),
            ),
          ),
        const SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(
            fontSize: context.constantUi.fontSizeMedium3,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            RatingStars(
              value: voteStars,
              starBuilder: (index, color) => Icon(
                Icons.star,
                color: color,
              ),
              starCount: 10,
              starSize: 20,
              valueLabelTextStyle: TextStyle(
                color: context.constantUi.whiteColor,
                fontSize: context.constantUi.fontSizeSmall2,
              ),
              maxValue: 10,
              starColor: context.constantUi.primaryColor,
            ),
          ],
        ),
        const SizedBox(height: 15),
        KVStringWidget(
          keyString: "Genres: ",
          value: genres,
        ),
        const SizedBox(height: 5),
        KVStringWidget(
          keyString: "Release Date: ",
          value: releaseData,
        ),
        const SizedBox(height: 5),
        KVStringWidget(
          keyString: "Overview: ",
          value: overview,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
