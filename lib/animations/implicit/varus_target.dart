import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class VarusTargetScanScreen extends StatefulWidget {
  final bool disableLoop;

  const VarusTargetScanScreen({super.key, this.disableLoop = false});

  @override
  State<VarusTargetScanScreen> createState() => _VarusTargetScanScreenState();
}

class _VarusTargetScanScreenState extends State<VarusTargetScanScreen> {
  final Random _random = Random();
  double _top = 100;
  double _left = 250;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    if(!widget.disableLoop) {
      _startTargetLoop();
    }
  }

  void _startTargetLoop() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _top = 80 + _random.nextDouble() * 100;  // Random vertical area
        _left = 180 + _random.nextDouble() * 200; // Random horizontal area
        _opacity = _opacity == 1.0 ? 0.0 : 1.0;
      });

      _startTargetLoop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Varus\' Target Scan',
      description: 'This animation shows EXOTECH Varus tracking multiple targets with a scanning system that randomly locks on to new threats.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          children: [
            // Varus standing
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/varus.png',
                width: 240,
                height: 240,
                fit: BoxFit.contain,
              ),
            ),
            // Randomly positioned target icon
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: _top,
              left: _left,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: Image.asset(
                  'assets/target_icon.png',
                  width: 50,
                  height: 50,
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
