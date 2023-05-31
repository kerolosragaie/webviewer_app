import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewer/core/constants/app_theme.dart';
import 'package:webviewer/core/constants/constants.dart';
import 'package:webviewer/core/utils/app_router.dart';
import 'package:webviewer/core/utils/service_locater.dart' as di;
import 'package:webviewer/features/home/presentation/manager/webview_cubit/webview_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              WebviewCubit(webViewController: di.sl<WebViewController>())
                ..initWebViewController(),
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
