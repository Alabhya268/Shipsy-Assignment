import 'result.dart';

class MovieClipModel {
  int? id;
  List<Result>? results;

  MovieClipModel({this.id, this.results});

  factory MovieClipModel.fromJson(Map<String, dynamic> json) {
    return MovieClipModel(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': results?.map((e) => e.toJson()).toList(),
      };

  MovieClipModel copyWith({
    int? id,
    List<Result>? results,
  }) {
    return MovieClipModel(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }
}
