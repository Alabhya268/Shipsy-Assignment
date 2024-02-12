import 'package:hive_flutter/hive_flutter.dart';

part 'ticket.g.dart';

@HiveType(typeId: 1)
class Ticket extends HiveObject {
  @HiveField(0)
  int? ticketId;

  @HiveField(1)
  int? movieId;

  @HiveField(2)
  String? movieName;

  @HiveField(3)
  String? movieImage;

  @HiveField(4)
  String? mallName;

  @HiveField(5)
  String? date;

  @HiveField(6)
  String? time;

  @HiveField(7)
  double? totalPrice;

  @HiveField(8)
  List<String>? seatNames;

  Ticket({
    this.ticketId,
    this.movieId,
    this.movieImage,
    this.movieName,
    this.mallName,
    this.date,
    this.time,
    this.totalPrice,
    this.seatNames,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        ticketId: json['ticket_id'] as int?,
        movieId: json['movie_id'] as int?,
        movieName: json['movie_name'] as String?,
        movieImage: json['movie_image'] as String?,
        mallName: json['mall_name'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        totalPrice: json['total_price'] as double?,
        seatNames: json['seat_name'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'ticket_id': ticketId,
        'movie_id': movieId,
        'movie_name': movieName,
        'movie_image': movieImage,
        'mall_name': mallName,
        'date': date,
        'time': time,
        'total_price': totalPrice,
        'seat_name': seatNames,
      };

  Ticket copyWith({
    int? ticketId,
    int? movieId,
    String? movieName,
    String? movieImage,
    String? mallName,
    String? date,
    String? time,
    double? totalPrice,
    List<String>? seatName,
  }) {
    return Ticket(
      ticketId: ticketId ?? this.ticketId,
      movieId: movieId ?? this.movieId,
      movieName: movieName ?? this.movieName,
      movieImage: movieImage ?? this.movieImage,
      mallName: mallName ?? this.mallName,
      date: date ?? this.date,
      time: time ?? this.time,
      totalPrice: totalPrice ?? this.totalPrice,
      seatNames: seatNames ?? seatNames,
    );
  }
}
