import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class NaafiriFadeScreen extends StatefulWidget {
  final bool disableLoop;

  const NaafiriFadeScreen({super.key, this.disableLoop = false});

  @override
  State<NaafiriFadeScreen> createState() => _NaafiriFadeScreenState();
}

class _NaafiriFadeScreenState extends State<NaafiriFadeScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    if(!widget.disableLoop) {
      _startFadeLoop();
    }
  }

  void _startFadeLoop() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _opacity = _opacity == 1.0 ? 0.0 : 1.0;
        });
        _startFadeLoop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Naafiri\'s Shadow Hunt',
      description: 'This animation shows Naafiri’s EXOTECH form phasing in and out, simulating her shadowy stealth movements.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: Image.asset(
              'assets/naafiri.png',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      showControls: false,
    );
  }
}
