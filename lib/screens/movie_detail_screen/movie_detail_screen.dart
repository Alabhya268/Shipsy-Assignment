// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/movie_detail/movie_detail_bloc.dart';

import 'package:shipsy_assignment/screens/movie_detail_screen/components/movie_detail_body_section.dart';
import 'package:shipsy_assignment/screens/movie_detail_screen/components/movie_detail_image_section.dart';
import 'package:shipsy_assignment/utils/app_error.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen(
      {super.key, required this.moviename, required this.movieId});

  final String moviename;
  final int movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool hideWidgets = false;

  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: "goN0lzObX8I",
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getUpcomingMovies() async {
    try {
      final upcomingMovies = context.read<MovieDetailBloc>();
      upcomingMovies.add(FetchMovieDetail(movieId: widget.movieId));
    } catch (e, s) {
      reportError.handleAppError(e, s);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await getUpcomingMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieDetails = context.watch<MovieDetailBloc>();
    final curDetail = movieDetails.state.movieDetail;
    final name = curDetail?.title ?? "";
    final movieClip = movieDetails.state.movieClipModel?.results
            ?.firstWhere((element) =>
                element.type == "Trailer" && element.site == "YouTube")
            .key ??
        "";

    return Builder(builder: (context) {
      return Scaffold(
        appBar: hideWidgets
            ? null
            : AppBar(
                title: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        floatingActionButton: hideWidgets
            ? Container(
                margin: const EdgeInsets.only(bottom: 50, right: 20),
                child: FloatingActionButton(
                  backgroundColor: context.constantUi.primaryColor,
                  onPressed: () {
                    controller.toggleFullScreenMode();
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: context.constantUi.whiteColor,
                    ),
                  ),
                ),
              )
            : null,
        body: YoutubePlayerBuilder(
          onEnterFullScreen: () {
            setState(() {
              hideWidgets = true;
            });
          },
          onExitFullScreen: () {
            setState(() {
              hideWidgets = false;
            });
          },
          player: YoutubePlayer(
            controller: controller,
          ),
          builder: (context, player) {
            return ListView(
              children: [
                const MovieDetailImageSection(),
                MovieDetailBodySection(
                  playVideo: () {
                    controller = YoutubePlayerController(
                      initialVideoId: movieClip,
                      flags: const YoutubePlayerFlags(
                        autoPlay: true,
                        mute: true,
                      ),
                    );
                    controller.toggleFullScreenMode();
                  },
                ).paddingAll(15),
              ],
            );
          },
        ),
      );
    });
  }
}
