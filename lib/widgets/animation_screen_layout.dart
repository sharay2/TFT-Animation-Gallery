import 'package:flutter/material.dart';

class AnimationScreenLayout extends StatelessWidget {
  final String title;
  final String description;
  final Widget animationWidget;
  final VoidCallback? onPlayPause;
  final VoidCallback? onReverse;
  final bool showControls;
  final bool isPlaying;
  final bool isReversed;

  const AnimationScreenLayout({
    super.key,
    required this.title,
    required this.description,
    required this.animationWidget,
    this.onPlayPause,
    this.onReverse,
    this.showControls = false,
    this.isPlaying = true,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orangeAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Row(
        children: [
          // Left 1/3: Description
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black,
              child: Center(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFC0C0C0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Right 2/3: Animation + Controls
          Flexible(
            flex: 2,
            child: Column(
              children: [
                // Animation fills available space above controls
                Expanded(
                  child: Center(
                    child: animationWidget,
                  ),
                ),
                const SizedBox(height: 12),
                // Controls pinned at bottom
                if (showControls)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: onPlayPause,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.black,
                        ),
                        child: Text(isPlaying ? 'Pause' : 'Play'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: onReverse,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isReversed ? const Color(0xFFB34700) : Colors.orangeAccent,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Reverse'),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
