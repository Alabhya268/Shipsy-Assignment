import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static final AppLogger _logger = AppLogger();

  static final instance = _logger;

  bool get showLogs => kDebugMode;

  void _logToConsole(Object? message,
      [Object? error, StackTrace? stackTrace, String? name]) {
    if (message != null) log(message.toString(), name: name ?? '');
    if (error != null || stackTrace != null) {
      debugPrintStack(label: error.toString(), stackTrace: stackTrace);
    }
  }

  void d(Object? message,
      [Object? error, StackTrace? stackTrace, String? name]) {
    if (showLogs) {
      _logToConsole(message.toString(), error, stackTrace, name);
    }
  }

  void dLog(Object? message,
      {Object? error, StackTrace? stackTrace, String? name}) {
    if (showLogs) {
      _logToConsole(message.toString(), error, stackTrace, name);
    }
  }

  void i(Object? message,
      [Object? error, StackTrace? stackTrace, String? name]) {
    if (showLogs) {
      _logToConsole(message.toString(), error, stackTrace, name);
    }
  }

  void e(Object? message,
      [Object? error, StackTrace? stackTrace, String? name]) {
    if (showLogs) {
      _logToConsole(message.toString(), error, stackTrace, name);
    }
  }
}

extension LoggerUtils on Object {
  AppLogger get appLogger => AppLogger._logger;
}
