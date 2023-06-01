import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewer/core/constants/app_theme.dart';
import 'package:webviewer/core/constants/constants.dart';
import 'package:webviewer/core/utils/app_router.dart';
import 'package:webviewer/features/home/presentation/store/webview_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => WebviewStore(context)..initWebview(),
        ),
      ],
      child: MaterialApp.router(
        title: kAppName,
        theme: kAppTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
