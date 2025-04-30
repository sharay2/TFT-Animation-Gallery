import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sharay2project3/home_screen.dart';
import 'package:sharay2project3/widgets/animation_screen_layout.dart';
import 'package:sharay2project3/animations/animation_export.dart';

void main() {
  group('Widget Tests', () {
    // 1. HomeScreen shows 8 animations
    testWidgets('HomeScreen shows all 8 animations', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      expect(find.byType(ListTile), findsNWidgets(8));
    });

    // 2. HomeScreen shows Jhin
    testWidgets('HomeScreen shows Jhin\'s Perfect Shot', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      expect(find.text('Jhin\'s Perfect Shot'), findsOneWidget);
    });

    // 3. HomeScreen shows Tactician's Crown
    testWidgets('HomeScreen shows Tactician\'s Crown', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      expect(find.text('Tactician\'s Crown'), findsOneWidget);
    });

    // 4. AnimationScreenLayout shows title and description
    testWidgets('AnimationScreenLayout shows title and description', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: AnimationScreenLayout(
          title: 'Test Animation',
          description: 'This is a test description.',
          animationWidget: const Placeholder(),
        ),
      ));
      expect(find.text('Test Animation'), findsOneWidget);
      expect(find.text('This is a test description.'), findsOneWidget);
    });

    // 5. AnimationScreenLayout shows animation widget
    testWidgets('AnimationScreenLayout shows animation widget', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: AnimationScreenLayout(
          title: 'Another Test',
          description: 'Another description',
          animationWidget: const Placeholder(),
        ),
      ));
      expect(find.byType(Placeholder), findsOneWidget);
    });

    // 6. BouncingBulletScreen shows controls
    testWidgets('BouncingBulletScreen shows Play/Pause and Reverse', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BouncingBulletScreen()));
      expect(find.text('Pause'), findsOneWidget);
      expect(find.text('Reverse'), findsOneWidget);
    });

    // 7. JaxSpinScreen shows controls
    testWidgets('JaxSpinScreen shows Play/Pause and Reverse', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: JaxSpinScreen()));
      expect(find.text('Pause'), findsOneWidget);
      expect(find.text('Reverse'), findsOneWidget);
    });

    // 8. ZeriSprintScreen shows Play/Pause and Reverse
    testWidgets('ZeriSprintScreen shows Play/Pause and Reverse', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ZeriSprintScreen()));
      expect(find.text('Pause'), findsOneWidget);
      expect(find.text('Reverse'), findsOneWidget);
    });

    // 9. SejuaniIceGrowthScreen does NOT show Play/Pause
    testWidgets('SejuaniIceGrowthScreen has no Play/Pause', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SejuaniIceGrowthScreen(disableLoop: true),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.widgetWithText(ElevatedButton, 'Pause'), findsNothing);
      expect(find.widgetWithText(ElevatedButton, 'Reverse'), findsNothing);
    });

    // 10. NaafiriFadeScreen has no Play/Pause
    testWidgets('NaafiriFadeScreen has no Play/Pause', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NaafiriFadeScreen(disableLoop: true),
        ),
      );
      expect(find.widgetWithText(ElevatedButton, 'Pause'), findsNothing);
      expect(find.widgetWithText(ElevatedButton, 'Reverse'), findsNothing);
    });
  });

  group('Integration Tests', () {
    // 1. Navigating to Jhin's Bouncing Bullet
    testWidgets('Tap Jhin navigates to BouncingBulletScreen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.tap(find.text("Jhin's Perfect Shot"));
      await tester.pump(const Duration(seconds: 1));
      expect(find.text("Jhin's Perfect Shot"), findsWidgets);
    });

    // 2. Navigating to Zeri's Sprint Screen
    testWidgets('Tap Zeri navigates to ZeriSprintScreen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.tap(find.text("Zeri's Lightning Sprint"));
      await tester.pump(const Duration(seconds: 1));
      expect(find.text("Zeri's Lightning Sprint"), findsWidgets);
    });

    // 3. Navigating to Jax's Spin Screen
    testWidgets('Tap Jax navigates to JaxSpinScreen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.tap(find.text("Jax's Counter-Spin"));
      await tester.pump(const Duration(seconds: 1));
      expect(find.text("Jax's Counter-Spin"), findsWidgets);
    });

    // 4. Navigating to Jhin's Bouncing Bullet and back to home screen
    testWidgets('Navigate back from Jhin screen returns to HomeScreen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      await tester.tap(find.text("Jhin's Perfect Shot"));
      await tester.pump(const Duration(seconds: 1));

      await tester.binding.handlePopRoute();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text("TFT Animation Gallery"), findsOneWidget);
    });

    // 5. Navigating to Zeri's Sprint Screen and back to home screen
    testWidgets('Navigate back from Zeri screen returns to HomeScreen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      await tester.tap(find.text("Zeri's Lightning Sprint"));
      await tester.pump(const Duration(seconds: 1));

      await tester.binding.handlePopRoute();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text("TFT Animation Gallery"), findsOneWidget);
    });

  });
}
