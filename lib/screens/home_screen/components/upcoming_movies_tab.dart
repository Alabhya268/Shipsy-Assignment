import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipsy_assignment/blocs/bloc/movie_detail_bloc.dart';
import 'package:shipsy_assignment/models/upcoming_movies_model/upcoming_item_model.dart';
import 'package:shipsy_assignment/services/injection_container.dart';
import 'package:shipsy_assignment/utils/constants/api_path/api_path.dart';
import 'package:shipsy_assignment/utils/extensions/widget_extensions.dart';

class UpComingMoviesTab extends StatefulWidget {
  const UpComingMoviesTab({
    super.key,
  });

  @override
  State<UpComingMoviesTab> createState() => _UpComingMoviesTabState();
}

class _UpComingMoviesTabState extends State<UpComingMoviesTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      BlocProvider.of<MovieDetailBloc>(context).add(MoviesFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    final upcomingMovies = context.watch<MovieDetailBloc>();
    final movieList = upcomingMovies.state.movieList;
    return GridView.builder(
      itemCount: movieList.length,
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () async {},
        child: Builder(builder: (context) {
          final curMovie = movieList[index];
          final name = curMovie.originalTitle ?? "";
          final releaseDate = curMovie.releaseDate ?? "";
          final adult = curMovie.adult ?? false ? "Yes" : "No";
          final image = getIt<RestAPIRequestPath>()
              .movieImage(curMovie.backdropPath ?? "");
          return Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 180,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      errorWidget: (context, e, w) => Container(),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Row(
                        children: [
                          const Text("Release on: "),
                          Text(releaseDate),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Adult: "),
                          Text(adult),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text("Book"),
                        ),
                      )
                    ],
                  ).paddingSymmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
