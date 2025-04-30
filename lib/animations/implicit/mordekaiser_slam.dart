import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class MordekaiserAbyssSlamScreen extends StatefulWidget {
  final bool disableLoop;

  const MordekaiserAbyssSlamScreen({super.key, this.disableLoop = false});

  @override
  State<MordekaiserAbyssSlamScreen> createState() => _MordekaiserAbyssSlamScreenState();
}

class _MordekaiserAbyssSlamScreenState extends State<MordekaiserAbyssSlamScreen> {
  double _waveSize = 100.0;
  double _opacity = 1.0;

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
        _waveSize = _waveSize == 100.0 ? 200.0 : 100.0;
        _opacity = _opacity == 1.0 ? 0.0 : 1.0;
      });
      _startPulseLoop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Mordekaiser\'s Abyssal Slam',
      description: 'This animation shows EXOTECH Mordekaiser slamming the ground with dark energy, sending shockwaves through the battlefield.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Mordekaiser standing
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/mordekaiser.png',
                width: 280,
                height: 280,
                fit: BoxFit.contain,
              ),
            ),
            // Expanding abyss wave
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: _waveSize,
                  height: _waveSize,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/abyss_wave.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
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
