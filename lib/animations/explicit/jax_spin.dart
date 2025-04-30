import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class JaxSpinScreen extends StatefulWidget {
  const JaxSpinScreen({super.key});

  @override
  State<JaxSpinScreen> createState() => _JaxSpinScreenState();
}

class _JaxSpinScreenState extends State<JaxSpinScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = true;
  bool _isReversed = false;
  double _rotationOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.isAnimating) {
        _controller.stop();
        _isPlaying = false;
      } else {
        _controller.repeat();
        _isPlaying = true;
      }
    });
  }

  void _reverseDirection() {
    setState(() {
      double currentAngle = (_isReversed ? -1 : 1) * _controller.value * 6.28;
      _rotationOffset += currentAngle;
      _controller.reset();
      _isReversed = !_isReversed;
      _controller.repeat(); // 🔥 Restart immediately after reversing
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Jax\'s Counter-Spin',
      description:
      'This animation shows Jax’s EXOTECH form spinning his energized weapon while standing firm, showcasing endless momentum.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Static Jax body
            Image.asset(
              'assets/jax.png',
              width: 240,
              height: 360,
              fit: BoxFit.contain,
            ),
            // Spinning weapon
            Positioned(
              bottom: -40,
              left: 180,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationOffset +
                        (_isReversed ? -1 : 1) * _controller.value * 6.28,
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/jax_weapon.png',
                  width: 190,
                  height: 290,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
      onPlayPause: _togglePlayPause,
      onReverse: _reverseDirection,
      showControls: true,
      isPlaying: _isPlaying,
      isReversed: _isReversed,
    );
  }
}
