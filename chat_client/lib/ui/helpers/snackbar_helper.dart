import 'package:flutter/material.dart';

class SnackbarHelper {
  static final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static void success(String message) async {
    snackbarKey.currentState!.hideCurrentSnackBar();

    snackbarKey.currentState!.showSnackBar(_customSnackbar(
      message: message,
      icon: Icons.done,
      bgcolor: Colors.green.shade600,
    ));
  }

  static void error(String message) async {
    snackbarKey.currentState!.hideCurrentSnackBar();

    snackbarKey.currentState!.showSnackBar(_customSnackbar(
      message: message,
      icon: Icons.error_outline_outlined,
      bgcolor: Colors.red.shade600,
    ));
  }

  static SnackBar _customSnackbar(
      {required String message, required Color bgcolor, required IconData icon}) {
    return SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(message),
        ],
      ),
      showCloseIcon: true,
      backgroundColor: bgcolor,
      closeIconColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    );
  }
}
