import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

/// This file is for widget testing main.dart.

void main() {
  group('Widgets Exist Test', () {
    // test that title of page appears
    testWidgets('Finds title', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('Smart Car Park'), findsOneWidget);
    });
    // test that default state is level 1, and all parking slots appear
    testWidgets('Finds level 1 slots', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('L1_A1'), findsOneWidget);
      expect(find.text('L1_A2'), findsOneWidget);
      expect(find.text('L1_A3'), findsOneWidget);
      expect(find.text('L1_A4'), findsOneWidget);
      expect(find.text('L1_B1'), findsOneWidget);
      expect(find.text('L1_B2'), findsOneWidget);
      expect(find.text('L1_B3'), findsOneWidget);
      expect(find.text('L1_B4'), findsOneWidget);
    });
    // test that bottom navigation bar appears with the 2 "buttons"
    testWidgets('Finds bottom navigation bar', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('Level 1'), findsOneWidget);
      expect(find.text('Level 2'), findsOneWidget);
    });
  });

  group('Bottom Navigation Bar Test', () {
    // test that floor changes when corresponding button is pressed
    testWidgets('Changes to level 2', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      // we are in level 1 by default
      expect(find.text('L1_A1'), findsOneWidget);
      // tap level 2 button
      await tester.tap(find.byKey(Key('level2')));
      // rebuild the widget
      await tester.pump();
      // we are in level 2 now
      expect(find.text('L2_A1'), findsOneWidget);
    });
  });
}
