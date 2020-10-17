//import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  group('Widgets Exist Test', () {
    testWidgets('Finds title', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('Smart Car Park'), findsOneWidget);
    });

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

    //test for level 2, need not private method
  });

  // doesn't work, maybe only with integration testing
  group('Flushbar Test', () {
    testWidgets('Flushbar exists if slot tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.tap(find.text('L1_A2'));
      await tester.pump();
      expect(find.text('Status'), findsOneWidget);
      //expect(find.byType(Flushbar), findsOneWidget);
    });
  });
}
