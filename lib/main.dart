import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webviewer/core/constants/app_theme.dart';
import 'package:webviewer/core/constants/constants.dart';
import 'package:webviewer/core/utils/app_router.dart';
import 'package:webviewer/features/home/presentation/manager/webview_cubit/webview_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WebviewCubit()..initWebView(),
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
