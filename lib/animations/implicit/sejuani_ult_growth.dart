import 'package:flutter/material.dart';
import '../../widgets/animation_screen_layout.dart';

class SejuaniIceGrowthScreen extends StatefulWidget {
  final bool disableLoop;

  const SejuaniIceGrowthScreen({super.key, this.disableLoop = false});

  @override
  State<SejuaniIceGrowthScreen> createState() => _SejuaniIceGrowthScreenState();
}

class _SejuaniIceGrowthScreenState extends State<SejuaniIceGrowthScreen> {
  double _size = 100.0;

  @override
  void initState() {
    super.initState();
    if (!widget.disableLoop) {
      _startGrowthLoop();
    }
  }

  void _startGrowthLoop() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _size = _size == 100.0 ? 160.0 : 100.0;
        });
        _startGrowthLoop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScreenLayout(
      title: 'Sejuani\'s Frost Charge',
      description: 'This animation shows Sejuani’s EXOTECH form preparing her ultimate as a massive ice force expands before her.',
      animationWidget: SizedBox(
        width: 600,
        height: 250,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 0,
              left: 40,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.1),
                      spreadRadius: 15,
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/sejuani.png',
                  width: 180,
                  height: 280,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(80, -10),
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: _size*2,
                height: _size,
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/sejuani_ult.png',
                  fit: BoxFit.fill,
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
