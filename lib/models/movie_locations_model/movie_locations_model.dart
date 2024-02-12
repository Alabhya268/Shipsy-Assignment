import 'location.dart';

class MovieLocationsModel {
  List<Location>? location;

  MovieLocationsModel({this.location});

  factory MovieLocationsModel.fromJson(Map<String, dynamic> json) {
    return MovieLocationsModel(
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'location': location?.map((e) => e.toJson()).toList(),
      };

  MovieLocationsModel copyWith({
    List<Location>? location,
  }) {
    return MovieLocationsModel(
      location: location ?? this.location,
    );
  }
}
