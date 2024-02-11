import 'package:shipsy_assignment/app_environment/app_environment.dart';

mixin RestAPIRequestProtocol {
  String upcomingMovies();
  String movieDetail(int movieId);
  String movieClip(int movieId);
  String movieImage(String moviePath);
}

class RestAPIRequestPath with RestAPIRequestProtocol {
  String get _baseUrl => AppEnvironment.baseUrl;
  String get _baseImageUrl => AppEnvironment.baseImageUrl;

  @override
  String upcomingMovies() => "$_baseUrl/movie/upcoming?language=en-US";
  @override
  String movieDetail(int movieId) => "$_baseUrl/movie/$movieId";
  @override
  String movieClip(int movieId) => "$_baseUrl/movie/$movieId/videos";
  @override
  String movieImage(String moviePath) => "$_baseImageUrl$moviePath";
}
