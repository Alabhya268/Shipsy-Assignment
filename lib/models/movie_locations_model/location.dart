import 'show.dart';

class Location {
  int? locationId;
  String? locationName;
  List<Show>? shows;

  Location({this.locationId, this.locationName, this.shows});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        locationId: json['location_id'] as int?,
        locationName: json['location_name'] as String?,
        shows: (json['shows'] as List<dynamic>?)
            ?.map((e) => Show.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'location_id': locationId,
        'location_name': locationName,
        'shows': shows?.map((e) => e.toJson()).toList(),
      };

  Location copyWith({
    int? locationId,
    String? locationName,
    List<Show>? shows,
  }) {
    return Location(
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      shows: shows ?? this.shows,
    );
  }
}
