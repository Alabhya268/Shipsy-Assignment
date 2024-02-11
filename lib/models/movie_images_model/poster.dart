class Poster {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Poster({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
        height: json['height'] as int?,
        iso6391: json['iso_639_1'] as String?,
        filePath: json['file_path'] as String?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
        width: json['width'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'aspect_ratio': aspectRatio,
        'height': height,
        'iso_639_1': iso6391,
        'file_path': filePath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'width': width,
      };

  Poster copyWith({
    double? aspectRatio,
    int? height,
    String? iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) {
    return Poster(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
      iso6391: iso6391 ?? this.iso6391,
      filePath: filePath ?? this.filePath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      width: width ?? this.width,
    );
  }
}
