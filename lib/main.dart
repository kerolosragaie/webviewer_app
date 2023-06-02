import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewer/core/constants/app_theme.dart';
import 'package:webviewer/core/constants/constants.dart';
import 'package:webviewer/core/utils/app_router.dart';
import 'package:webviewer/core/utils/functions/permissions_handler.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/store/bluetooth_store.dart';
import 'package:webviewer/features/home/presentation/store/webview_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
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
        Provider(
          create: (_) => BluetoothStore(context),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: kAppTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
