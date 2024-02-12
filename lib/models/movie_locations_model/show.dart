class Show {
  int? showId;
  String? mallName;
  String? date;
  String? time;

  Show({this.showId, this.mallName, this.date, this.time});

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        showId: json['show_id'] as int?,
        mallName: json['mall_name'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'show_id': showId,
        'mall_name': mallName,
        'date': date,
        'time': time,
      };

  Show copyWith({
    int? showId,
    String? mallName,
    String? date,
    String? time,
  }) {
    return Show(
      showId: showId ?? this.showId,
      mallName: mallName ?? this.mallName,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
