class Result {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;

  String? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        iso6391: json['iso_639_1'] as String?,
        iso31661: json['iso_3166_1'] as String?,
        name: json['name'] as String?,
        key: json['key'] as String?,
        site: json['site'] as String?,
        type: json['type'] as String?,
        official: json['official'] as bool?,
        publishedAt: json['published_at'] == null
            ? null
            : DateTime.parse(json['published_at'] as String),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso6391,
        'iso_3166_1': iso31661,
        'name': name,
        'key': key,
        'site': site,
        'type': type,
        'official': official,
        'published_at': publishedAt?.toIso8601String(),
        'id': id,
      };

  Result copyWith({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    String? type,
    bool? official,
    DateTime? publishedAt,
    String? id,
  }) {
    return Result(
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }
}
