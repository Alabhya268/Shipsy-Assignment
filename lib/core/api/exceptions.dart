import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shipsy_assignment/models/api_error_model/api_error_model.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';

abstract class AppException implements Exception {}

class APIException extends AppException {
  APIException({this.error, this.stackTrace});

  final Object? error;
  final StackTrace? stackTrace;

  String message() {
    return 'Something went wrong';
  }

  @override
  String toString() {
    return 'APIException(error: $error, message: ${message()})';
  }
}

class GenericException extends AppException {}

class PermissionForeverDeniedException extends AppException {
  String message() {
    return 'Permission are permanently denied, we cannot request permission.';
  }

  @override
  String toString() {
    return 'PermissionForeverDeniedException(message: ${message()})';
  }
}

class PermissionDeniedException extends AppException {
  String message() {
    return 'Permission was denied.';
  }

  @override
  String toString() {
    return 'PermissionDeniedException(message: ${message()})';
  }
}

class AbortedException extends AppException {
  String message() {
    return 'Request was aborted.';
  }

  @override
  String toString() {
    return 'AbortedException(message: ${message()})';
  }
}

class APIErrorException extends DioException {
  APIErrorException({
    required super.requestOptions,
    this.apiError,
    this.errorStackTrace,
    super.error,
    super.response,
    super.type,
    super.message,
    super.stackTrace,
  }) {
    apiError ??= ApiError(
      error: super.error,
      message: super.message,
      statusCode: super.response?.statusCode,
    );
  }

  ApiError? apiError;
  final StackTrace? errorStackTrace;

  @override
  String get message {
    if (kDebugMode) {
      appLogger.e('API error message: ${super.message}');

      appLogger.e('API error: ${apiError?.error}');
      appLogger.e('API error status: ${apiError?.statusCode}');
      appLogger.e('Dio error: ${super.error}');
    }
    return apiError?.message ?? 'Something went wrong';
  }
}

class UnauthorizedException extends APIErrorException {
  UnauthorizedException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class ForbiddenException extends APIErrorException {
  ForbiddenException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class NotFoundException extends APIErrorException {
  NotFoundException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class ValidationException extends APIErrorException {
  ValidationException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class InternalServerErrorException extends APIErrorException {
  InternalServerErrorException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class BadGatewayException extends APIErrorException {
  BadGatewayException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class ServiceUnavailableException extends APIErrorException {
  ServiceUnavailableException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class GatewayTimeoutException extends APIErrorException {
  GatewayTimeoutException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}

class ConnectionTimeoutException extends APIErrorException {
  ConnectionTimeoutException(
      {super.errorStackTrace, super.apiError, required super.requestOptions});
}
