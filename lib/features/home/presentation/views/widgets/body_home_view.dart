import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webviewer/core/widgets/cusomt_error.dart';
import 'package:webviewer/core/widgets/loading_indicator.dart';
import 'package:webviewer/features/home/presentation/manager/webview_cubit/webview_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebviewCubit, WebviewState>(
      builder: (context, state) {
        if (state is WebviewLoading) {
          return LoadingIndicators.ballSpinFadeLoader(context: context);
        } else if (state is WebviewLoaded) {
          return state.webView;
        } else if (state is WebviewError) {
          return CustomErrorWidget(
            errorMessage: state.error.message,
          );
        }
        return LoadingIndicators.ballSpinFadeLoader(context: context);
      },
    );
  }
}
