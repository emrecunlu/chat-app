import 'package:chat_client/core/init/app_theme.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:chat_client/ui/pages/common/splash_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SocketService.instance.initialize("http://192.168.1.41:3000");
  await StorageService.instance.initialize();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: appTheme,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: SnackbarHelper.snackbarKey,
    );
  }
}
