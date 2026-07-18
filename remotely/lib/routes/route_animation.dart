import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTransitions {
  static CustomTransitionPage buildTransitionPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideTween = Tween(
          begin: const Offset(0.2, 0), // slight right → left
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.ease));

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: animation.drive(slideTween),
            child: child,
          ),
        );
      },
    );
  }
}