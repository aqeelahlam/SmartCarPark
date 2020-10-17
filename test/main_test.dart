//import 'package:test/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Finds "Smart Car Park"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Smart Car Park'), findsOneWidget);

  });
}

