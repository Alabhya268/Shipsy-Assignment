import 'backdrop.dart';
import 'poster.dart';

class MovieImagesModel {
  List<Backdrop>? backdrops;
  int? id;
  List<Poster>? posters;

  MovieImagesModel({this.backdrops, this.id, this.posters});

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) {
    return MovieImagesModel(
      backdrops: (json['backdrops'] as List<dynamic>?)
          ?.map((e) => Backdrop.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      posters: (json['posters'] as List<dynamic>?)
          ?.map((e) => Poster.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'backdrops': backdrops?.map((e) => e.toJson()).toList(),
        'id': id,
        'posters': posters?.map((e) => e.toJson()).toList(),
      };

  MovieImagesModel copyWith({
    List<Backdrop>? backdrops,
    int? id,
    List<Poster>? posters,
  }) {
    return MovieImagesModel(
      backdrops: backdrops ?? this.backdrops,
      id: id ?? this.id,
      posters: posters ?? this.posters,
    );
  }
}
