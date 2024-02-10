class ApiError {
  final int? statusCode;
  final String? message;
  final Object? error;

  const ApiError({this.statusCode, this.message, this.error});

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        statusCode: json['statusCode'] as int?,
        message: json['message'] as String?,
        error: json['error'] as Object?,
      );

  ApiError copyWith({
    int? statusCode,
    String? message,
    Object? error,
  }) {
    return ApiError(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}
