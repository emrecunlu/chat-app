import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:chat_client/ui/pages/auth/login/login_page.dart';
import 'package:chat_client/ui/pages/chat/chat/chat_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseWidget<SplashPage> {
  Future<void> authCheck() async {
    await Future.delayed(Duration(milliseconds: 500));

    final bool isAuth = AuthHelper.isLoggedIn();

    isAuth
        ? NavigationService.replaceScreen(ChatPage())
        : NavigationService.replaceScreen(LoginPage());
  }

  @override
  void initState() {
    authCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: themeData.primaryColor,
        ),
      ),
    );
  }
}
