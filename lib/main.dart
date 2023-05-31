import 'package:flutter/material.dart';
import 'package:webviewer/core/constants/app_theme.dart';
import 'package:webviewer/core/constants/constants.dart';
import 'package:webviewer/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: kAppName,
      theme: kAppTheme,
      routerConfig: AppRouter.router,
    );
  }
}
