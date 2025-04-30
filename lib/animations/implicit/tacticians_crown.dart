import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class TacticianCrownScreen extends StatefulWidget {
  final bool disableLoop;

  const TacticianCrownScreen({super.key, this.disableLoop = false});

  @override
  State<TacticianCrownScreen> createState() => _TacticianCrownScreenState();
}

class _TacticianCrownScreenState extends State<TacticianCrownScreen> {
  Alignment _alignment = Alignment.center;
  double _scale = 1.0;
  double _glowOpacity = 0.8;

  @override
  void initState() {
    super.initState();
    if(!widget.disableLoop) {
      _startPulseLoop();
    }
  }

  void _startPulseLoop() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _alignment = _alignment == Alignment.center
            ? Alignment(0, -0.08)
            : Alignment.center;
        _scale = _scale == 1.0 ? 1.05 : 1.0;
        _glowOpacity = _glowOpacity == 0.2 ? 1.0 : 0.2;
      });
      _startPulseLoop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Tactician\'s Crown',
      description: 'This animation shows the Tactician’s Crown floating and pulsing with celestial EXOTECH energy.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glowing aura behind the crown
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _glowOpacity,
              child: Image.asset(
                'assets/crown_glow.png',
                width: 320,
                height: 320,
                fit: BoxFit.contain,
              ),
            ),
            // Floating and scaling crown
            AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/tactician_crown.png',
                  width: 140,
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
      showControls: false,
    );
  }
}
