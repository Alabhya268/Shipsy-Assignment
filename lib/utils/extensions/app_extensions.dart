import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextHelper on BuildContext {
  MediaQueryData get appMediaQuery => MediaQuery.of(this);
  Size get mediaSize => appMediaQuery.size;
  double get mediaWidth => mediaSize.width;
  double get mediaHeight => mediaSize.height;

  void showSnackBar(
    String message, {
    ValueChanged<SnackBarClosedReason>? onClosed,
    TextStyle? textStyle,
    Color? backgroundColor,
    bool removeCurrentSnackBar = true,
    SnackBarAction? action,
    Duration? duration,
    SnackBarBehavior? snackBarBehavior,
    Widget? content,
    ShapeBorder? shape,
  }) {
    final scaffold = ScaffoldMessenger.of(this);
    if (removeCurrentSnackBar) scaffold.removeCurrentSnackBar();

    if (!mounted) return;

    final snackBarWidget = SnackBar(
      shape: shape,
      backgroundColor: backgroundColor,
      behavior: snackBarBehavior ?? SnackBarBehavior.floating,
      content: content ??
          Text(
            message,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
      action: action,
      duration: duration ?? const Duration(seconds: 4),
    );

    final snackBar = scaffold.showSnackBar(snackBarWidget);

    snackBar.closed.then((value) => onClosed?.call(value));
  }

  Future<DateTime?> showAdaptiveDatePicker() async {
    return Platform.isIOS
        ? await _showIosDatePicker()
        : await _showAndroidDatePicker();
  }

  Future<DateTime?> _showAndroidDatePicker() async {
    final pickedDate = await showDatePicker(
      context: this,
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
    );

    return pickedDate;
  }

  Future<DateTime?> _showIosDatePicker() async {
    DateTime? pickedDate;

    await showCupertinoModalPopup(
      context: this,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            maximumDate: DateTime.now(),
            minimumDate: DateTime(1900),
            onDateTimeChanged: (DateTime value) {
              pickedDate = value;
            },
          ),
        ),
      ),
    );

    return pickedDate;
  }

  void showErrorSnackBar(
    String message, {
    ValueChanged<SnackBarClosedReason>? onClosed,
    bool removeCurrentSnackBar = true,
    SnackBarAction? action,
    Duration? duration,
    SnackBarBehavior? snackBarBehavior,
  }) {
    showSnackBar(
      message,
      onClosed: onClosed,
      backgroundColor: const Color(0xff4d4d4d),
      textStyle: const TextStyle(color: Colors.white),
      removeCurrentSnackBar: removeCurrentSnackBar,
      action: action,
      duration: duration,
      snackBarBehavior: snackBarBehavior,
    );
  }

  void showSuccessSnackBar(
    String message, {
    ValueChanged<SnackBarClosedReason>? onClosed,
    bool removeCurrentSnackBar = true,
    SnackBarAction? action,
    Duration? duration,
    SnackBarBehavior? snackBarBehavior,
  }) {
    showSnackBar(
      message,
      onClosed: onClosed,
      backgroundColor: const Color(0xff4d4d4d),
      textStyle: const TextStyle(color: Colors.white),
      removeCurrentSnackBar: removeCurrentSnackBar,
      action: action,
      duration: duration,
      snackBarBehavior: snackBarBehavior,
    );
  }
}
