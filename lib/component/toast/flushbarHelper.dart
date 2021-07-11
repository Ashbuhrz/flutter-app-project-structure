import 'package:flutter/material.dart';
import 'package:project_structure/component/toast/flushbar.dart';

class MessageBar {
  static Flushbar success(
      {required String message,
      Duration duration = const Duration(seconds: 5)}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Text('Success'),
      messageText: Text(
        message,
      ),
      borderColor: const Color(0xFF53565A),
      borderWidth: 0,
      backgroundColor: const Color(0xFFEFE1D9),
      icon: Icon(
        Icons.check_circle,
        color: const Color(0xFF53565A),
      ),
      duration: duration,
    );
  }

  static Flushbar information(
      {required String message,
      Duration duration = const Duration(seconds: 5)}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Text('Info'),
      messageText: Text(message),
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: const Color(0xFFFFA600),
      ),
      duration: duration,
      backgroundColor: const Color(0xFFEFE1D9),
      borderColor: const Color(0xFFFFA600),
    );
  }

  /// Get a error notification flushbar
  static Flushbar error(
      {required String? message,
      Duration duration = const Duration(seconds: 5)}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Text('Error'),
      messageText: Text(message ?? ''),
      backgroundColor: const Color(0xFFEFE1D9),
      borderColor: const Color(0xFFDE5959),
      borderWidth: 0,
      icon: Icon(
        Icons.highlight_off,
        size: 28.0,
        color: const Color(0xFF53565A),
      ),
      duration: duration,
    );
  }

  static Flushbar nonDismisable(
      {required String message,
      Duration duration = const Duration(seconds: 5)}) {
    return Flushbar(
        title: 'Error',
        flushbarPosition: FlushbarPosition.TOP,
        message: message,
        borderColor: const Color(0xFFDE5959),
        borderWidth: 0,
        icon: Icon(
          Icons.highlight_off,
          size: 28.0,
          color: const Color(0xFFDE5959),
        ),
        duration: duration,
        isDismissible: false);
  }
}
