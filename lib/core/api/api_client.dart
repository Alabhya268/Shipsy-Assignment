import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shipsy_assignment/app_environment/app_environment.dart';
import 'package:shipsy_assignment/core/api/exceptions.dart';
import 'package:shipsy_assignment/models/api_error_model/api_error_model.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';
import 'package:shipsy_assignment/utils/helper_enums.dart';

class RestApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'Authorization': AppEnvironment.apiToken,
          'Content-Type': 'application/json'
        }),
  );

  Future<Response<dynamic>> sendRequest(
    RequestType requestType,
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return switch (requestType) {
      RequestType.get => await get(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ),
      RequestType.post => await post(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data,
        ),
      RequestType.put => await put(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data,
        ),
      RequestType.delete => await delete(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        ),
    };
  }

  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.patch(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}

extension ResponseUtils on Response {
  int? get statusCode => this.statusCode;

  dynamic get json => data;

  Map<String, dynamic>? get jsonMap => json as Map<String, dynamic>?;
}

extension ApiErrorUtils on DioException {
  int? get statusCode => response?.statusCode;

  dynamic get json => response?.data;

  Map<String, dynamic>? get jsonMap {
    if (json is Map<String, dynamic>) {
      return json;
    } else if (json is String) {
      return jsonDecode(json);
    }

    return null;
  }

  DioException get apiError {
    if (kDebugMode) {
      appLogger.dLog(response?.data,
          error: error, stackTrace: stackTrace, name: 'API Error');
    }

    final errorStackTrace = stackTrace;

    final apiError =
        ApiError.fromJson(jsonMap ?? {}).copyWith(statusCode: statusCode);

    if (type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.cancel ||
        statusCode == 599) {
      throw ConnectionTimeoutException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 401) {
      throw UnauthorizedException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 403) {
      throw ForbiddenException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 404) {
      throw NotFoundException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 422) {
      return ValidationException(
        apiError: apiError,
        errorStackTrace: errorStackTrace,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 500) {
      throw InternalServerErrorException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 502) {
      throw BadGatewayException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 503) {
      throw ServiceUnavailableException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else if (statusCode == 504) {
      throw GatewayTimeoutException(
        errorStackTrace: errorStackTrace,
        apiError: apiError,
        requestOptions: requestOptions,
      );
    } else {
      return APIErrorException(
        apiError:
            ApiError.fromJson(jsonMap ?? {}).copyWith(statusCode: statusCode),
        errorStackTrace: errorStackTrace,
        requestOptions: requestOptions,
      );
    }
  }
}
