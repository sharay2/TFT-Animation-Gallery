import 'package:flutter/material.dart';

class ScaleTransitionRoute extends PageRouteBuilder {
  final Widget screen;

  ScaleTransitionRoute({required this.screen})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<double>(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.easeInOut));

      return ScaleTransition(
        scale: animation.drive(tween),
        child: child,
      );
    },
  );
}
