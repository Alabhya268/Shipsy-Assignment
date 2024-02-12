import 'ticket.dart';

class MovieTicketsModel {
  List<Ticket>? tickets;

  MovieTicketsModel({this.tickets});

  factory MovieTicketsModel.fromJson(Map<String, dynamic> json) {
    return MovieTicketsModel(
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'tickets': tickets?.map((e) => e.toJson()).toList(),
      };

  MovieTicketsModel copyWith({
    List<Ticket>? tickets,
  }) {
    return MovieTicketsModel(
      tickets: tickets ?? this.tickets,
    );
  }
}
