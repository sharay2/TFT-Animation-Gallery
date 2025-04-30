import 'package:flutter/material.dart';
import '../transitions/transition_export.dart';

class ScreenTransition {
  static PageRoute buildPageRoute(Widget screen, int animationIndex) {
    switch (animationIndex) {
      case 0: // Jhin's Bouncing Bullet -> Slide Transition
        return SlideTransitionRoute(screen: screen);
      case 1: // Naafiri Fade -> Fade Transition
        return FadeTransitionRoute(screen: screen);
      case 2: // Zeri Sprint -> Slide from Left Transition
        return SlideFromLeftTransitionRoute(screen: screen);
      case 3: // Sejuani's Ice Power Surge (growing/shrinking) -> Scale Transition
        return ScaleTransitionRoute(screen: screen);
      case 4: // Jax's Counter-Spin -> Rotation Transition
        return RotationTransitionRoute(screen: screen);
      case 5: // Varus' Target Scan -> Slide from Bottom Right Transition
        return SlideFromBottomRightTransitionRoute(screen: screen);
      case 6: // Mordekaiser Slam -> Dark Fade Transition
        return DarkFadeTransition(screen: screen);
      case 7: // Tactician's Crown -> Slide + Fade Transition
        return SlideFadeTransitionRoute(screen: screen);


      default:
        return MaterialPageRoute(builder: (_) => screen);
    }
  }
}
