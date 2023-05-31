import 'package:flutter/material.dart';
import 'package:webviewer/features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:webviewer/features/home/presentation/views/widgets/body_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      body: HomeViewBody(),
    );
  }
}
