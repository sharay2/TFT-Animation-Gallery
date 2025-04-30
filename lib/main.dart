/* Stephen Harayo
 * sharay2, 675165774
 * Project 3 - Animation Nation
 * This is the TFT Animation Gallery. I will explain the project in the README so that it's easier to see what
 * the files are for since my project follows the TFT theme, a game that I like to play.
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const AnimationNationApp());
  });
}

class AnimationNationApp extends StatelessWidget {
  const AnimationNationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TFT Animation Gallery',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orangeAccent,
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF1C1C1C),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFC0C0C0)),
          bodyLarge: TextStyle(color: Color(0xFFC0C0C0)),
          titleLarge: TextStyle(color: Colors.orangeAccent),
        ),
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.orangeAccent,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
