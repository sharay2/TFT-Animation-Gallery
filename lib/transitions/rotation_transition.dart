import 'package:flutter/material.dart';

class RotationTransitionRoute extends PageRouteBuilder {
  final Widget screen;

  RotationTransitionRoute({required this.screen})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final rotateTween = Tween<double>(begin: -1.0, end: 0.0)
          .chain(CurveTween(curve: Curves.easeInOut));

      return RotationTransition(
        turns: animation.drive(rotateTween),
        child: child,
      );
    },
  );
}
