import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTransitionAnimatedPage {
  static CustomTransitionPage transitionScale(
      {required GoRouterState state, required StatelessWidget page}) {
    return CustomTransitionPage<void>(
      transitionDuration: const Duration(seconds: 1),
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(scale: animation, child: child),
    );
  }
}
