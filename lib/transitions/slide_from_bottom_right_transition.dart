import 'package:flutter/material.dart';

class SlideFromBottomRightTransitionRoute extends PageRouteBuilder {
  final Widget screen;

  SlideFromBottomRightTransitionRoute({required this.screen})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      final tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
