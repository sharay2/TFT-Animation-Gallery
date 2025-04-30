import 'package:flutter/material.dart';
import 'animations/animation_export.dart';
import 'widgets/screen_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animations = [
      {'title': 'Jhin\'s Perfect Shot', 'icon': Icons.center_focus_strong},
      {'title': 'Naafiri\'s Shadow Hunt', 'icon': Icons.pets},
      {'title': 'Zeri\'s Lightning Sprint', 'icon': Icons.bolt},
      {'title': 'Sejuani\'s Frost Charge', 'icon': Icons.ac_unit},
      {'title': 'Jax\'s Counter-Spin', 'icon': Icons.sports_mma},
      {'title': 'Varus\' Target Scan', 'icon': Icons.arrow_forward},
      {'title': 'Mordekaiser\'s Abyssal Slam', 'icon': Icons.shield},
      {'title': 'Tactician\'s Crown', 'icon': Icons.emoji_events},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TFT Animation Gallery'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orangeAccent, width: 2),
              ),
              child: ListTile(
                leading: Icon(
                  animations[index]['icon'] as IconData,
                  size: 36,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  animations[index]['title'] as String,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                hoverColor: Colors.orangeAccent.withOpacity(0.2),
                onTap: () {
                  Widget nextScreen;

                  switch (index) {
                    case 0:
                      nextScreen = const BouncingBulletScreen();
                      break;
                    case 1:
                      nextScreen = const NaafiriFadeScreen();
                      break;
                    case 2:
                      nextScreen = const ZeriSprintScreen();
                      break;
                    case 3:
                      nextScreen = const SejuaniIceGrowthScreen();
                      break;
                    case 4:
                      nextScreen = const JaxSpinScreen();
                      break;
                    case 5:
                      nextScreen = const VarusTargetScanScreen();
                      break;
                    case 6:
                      nextScreen = const MordekaiserAbyssSlamScreen();
                      break;
                    case 7:
                      nextScreen = const TacticianCrownScreen();
                      break;
                    default:
                      nextScreen = const Scaffold(
                        body: Center(child: Text('Screen not implemented')),
                      );
                  }

                  Navigator.of(context).push(
                    ScreenTransition.buildPageRoute(nextScreen, index),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
