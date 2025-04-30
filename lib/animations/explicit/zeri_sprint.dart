import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class ZeriSprintScreen extends StatefulWidget {
  const ZeriSprintScreen({super.key});

  @override
  State<ZeriSprintScreen> createState() => _ZeriSprintScreenState();
}

class _ZeriSprintScreenState extends State<ZeriSprintScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = true;
  bool _isReversed = false;
  double _currentVelocity = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _currentVelocity = -1.0;
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _currentVelocity = 1.0;
        _controller.forward();
      }
    });
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
        if (_currentVelocity > 0) {
          _controller.forward(from: _controller.value);
        } else {
          _controller.reverse(from: _controller.value);
        }
        _isPlaying = true;
      }
    });
  }

  void _reverseDirection() {
    setState(() {
      _isReversed = !_isReversed;
      _currentVelocity = -_currentVelocity;

      if (_controller.isAnimating) {
        if (_currentVelocity > 0) {
          _controller.forward(from: _controller.value);
        } else {
          _controller.reverse(from: _controller.value);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Zeri\'s Lightning Sprint',
      description: 'This animation shows Zeri’s EXOTECH form dashing rapidly across the field, simulating her electrified speed.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(220 * (_controller.value * 2 - 1), 0),
                  child: child,
                );
              },
              child: Image.asset(
                'assets/zeri.png',
                width: 280,
                height: 280,
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
