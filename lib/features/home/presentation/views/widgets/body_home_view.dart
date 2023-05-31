import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewer/features/home/presentation/manager/webview_cubit/webview_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebviewCubit, WebviewState>(
      builder: (context, state) {
        if (state is WebviewLoading) {
          return const CircularProgressIndicator();
        } else if (state is WebviewLoaded) {
          return WebViewWidget(
            controller: state.webViewController,
          );
        } else if (state is WebviewError) {
          return Center(
            child: Text(state.error.message),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
