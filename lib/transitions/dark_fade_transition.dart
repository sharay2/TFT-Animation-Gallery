import 'package:flutter/material.dart';

class DarkFadeTransition extends PageRouteBuilder {
  final Widget screen;

  DarkFadeTransition({required this.screen})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animation<double> opacityAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      Animation<double> scaleAnimation = Tween<double>(
        begin: 0.8,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutBack,
      ));

      return FadeTransition(
        opacity: opacityAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 1300),
  );
}
