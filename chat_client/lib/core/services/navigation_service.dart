import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> nextScreen(dynamic page) async {
    await navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static Future<void> replaceScreen(dynamic page) async {
    await navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static void back() async {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }

  static void closeAll(dynamic page) async {
    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => page,
        ),
        (route) => false);
  }
}
