import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTransitionAnimatedPage {
  static CustomTransitionPage transitionFade(
      {required GoRouterState state, required StatelessWidget page}) {
    return CustomTransitionPage<void>(
      transitionDuration: const Duration(milliseconds: 200),
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
