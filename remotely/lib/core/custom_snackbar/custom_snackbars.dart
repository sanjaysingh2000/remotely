import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

/// 1. Yeh key MaterialApp ke scaffoldMessengerKey mein daalo
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

/// 2. Yeh helper kahin se bhi call karo — context ki zaroorat nahi
class AppSnackbar {
  AppSnackbar._(); // instantiate na ho, sirf static methods

  static void show({
    required String title,
    required String message,
    ContentType type = ContentType.success,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
      ),
    );

    // pehle purana snackbar hatao, warna queue mein lag jaayega
    snackbarKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void success(String message, {String title = 'Success!'}) {
    show(title: title, message: message, type: ContentType.success);
  }

  static void failure(String message, {String title = 'On Snap!'}) {
    show(title: title, message: message, type: ContentType.failure);
  }

  static void warning(String message, {String title = 'Careful!'}) {
    show(title: title, message: message, type: ContentType.warning);
  }

  static void help(String message, {String title = 'Note'}) {
    show(title: title, message: message, type: ContentType.help);
  }
}