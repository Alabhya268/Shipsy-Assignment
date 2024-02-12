class Seat {
  int? seatId;
  double? seatPrice;
  String? seatName;

  Seat({this.seatId, this.seatName, this.seatPrice});

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        seatId: json['seat_id'] as int?,
        seatPrice: json['price'] as double?,
        seatName: json['seat_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'seat_id': seatId,
        'seat_name': seatName,
        'price': seatName,
      };

  Seat copyWith({
    int? seatId,
    String? seatName,
  }) {
    return Seat(
      seatId: seatId ?? this.seatId,
      seatName: seatName ?? this.seatName,
    );
  }
}
