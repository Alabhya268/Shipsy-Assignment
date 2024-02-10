import 'package:flutter/widgets.dart';
import 'package:shipsy_assignment/core/api/exceptions.dart';
import 'package:shipsy_assignment/utils/app_logger.dart';
import 'package:shipsy_assignment/utils/extensions/app_extensions.dart';

class AppErrorReporter {
  AppErrorReporter._();

  static final AppErrorReporter instance = AppErrorReporter._();

  Future<void> handleAppError(
    dynamic e,
    StackTrace? s, [
    BuildContext? context,
    String? errorLocation,
  ]) async {
    try {
      if (appLogger.showLogs) {
        appLogger.dLog(
          'error and stacktrace log, errorLocation: $errorLocation',
          error: e,
          stackTrace: s,
          name: 'AppErrorReporter',
        );
        context?.showSnackBar(
          e.toString(),
          duration: const Duration(seconds: 15),
        );
      }

      if (e is ConnectionTimeoutException) {
        context?.showErrorSnackBar(
            'We are unable to process the request, please try again later.');
      } else if (e is ValidationException) {
        context?.showErrorSnackBar('Please enter valid details.');
      } else if (e is APIErrorException) {
        context?.showErrorSnackBar(
            'We are unable to process the request, please try again later.');
      } else {
        context?.showErrorSnackBar(
          'Something went wrong.',
        );
      }
    } catch (e, s) {
      context?.showErrorSnackBar(
        'Something went wrong.',
      );
      appLogger.e('error and stacktrace log in app_error.dart');
      appLogger.e(e, s);
    }
  }
}

extension ErrorReporterUtils on Object {
  AppErrorReporter get reportError => AppErrorReporter.instance;
}
