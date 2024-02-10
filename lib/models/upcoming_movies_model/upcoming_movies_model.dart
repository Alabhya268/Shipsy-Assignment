import 'upcoming_item_model.dart';

class UpcomingMoviesModel {
  int? page;
  List<UpcomingItemModel>? results;
  int? totalPages;

  UpcomingMoviesModel({
    this.page,
    this.results,
    this.totalPages,
  });

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UpcomingItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
      };

  UpcomingMoviesModel copyWith({
    int? page,
    List<UpcomingItemModel>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return UpcomingMoviesModel(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
