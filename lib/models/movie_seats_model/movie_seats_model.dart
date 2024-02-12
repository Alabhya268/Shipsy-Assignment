import 'seat.dart';

class MovieSeatsModel {
  List<Seat>? seats;

  MovieSeatsModel({this.seats});

  factory MovieSeatsModel.fromJson(Map<String, dynamic> json) {
    return MovieSeatsModel(
      seats: (json['seats'] as List<dynamic>?)
          ?.map((e) => Seat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'seats': seats?.map((e) => e.toJson()).toList(),
      };

  MovieSeatsModel copyWith({
    List<Seat>? seats,
  }) {
    return MovieSeatsModel(
      seats: seats ?? this.seats,
    );
  }
}
