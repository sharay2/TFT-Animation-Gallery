import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class BouncingBulletScreen extends StatefulWidget {
  const BouncingBulletScreen({super.key});

  @override
  State<BouncingBulletScreen> createState() => _BouncingBulletScreenState();
}

class _BouncingBulletScreenState extends State<BouncingBulletScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  bool _isPlaying = true;
  double _currentVelocity = 1.0;
  bool _isReversedMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    _controller.forward();

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
      _isReversedMode = !_isReversedMode;
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
      title: 'Jhin\'s Perfect Shot',
      description: 'This animation shows an EXOTECH projectile ricocheting upward and downward with realistic bounce motion, symbolizing Jhin’s perfected ballistic precision.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Jhin standing
            Positioned(
              bottom: 0,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orangeAccent.withOpacity(0.15),
                      spreadRadius: 20,
                      blurRadius: 40,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/jhin.png',
                  width: 160,
                  height: 260,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //Jhin's bouncing bullet
            Positioned(
              bottom: 100,
              child: AnimatedBuilder(
                animation: _curvedAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 100 * _curvedAnimation.value),
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/jhin_bullet.png',
                  width: 50,
                  height: 50,
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
      isReversed: _isReversedMode,
    );
  }
}
