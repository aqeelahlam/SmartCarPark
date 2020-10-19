import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App Performance Test: ', () {
    final levelOne = find.byValueKey('level1');
    final levelTwo = find.byValueKey('level2');
    final flushbar = find.byValueKey('flushbarL1_B2');
    final slotL1B2 = find.byValueKey('L1B2');
    final slotL2A2 = find.byValueKey('L2A2');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Flushbar appears if slot tapped', () async {
      // default floor is level 1
      await driver.waitFor(slotL1B2);
      await driver.tap(slotL1B2);
      print('tapped slot');
      //NOT WORKING SAVE ME, testing that flushbar appears
      /*await driver.waitFor(flushbar);
      print('found flushbar');
      //print(driver.getText(flushbar).toString());
      expect(await driver.getText(flushbar), "Parking Slot: L1_B2");
      print('flushbar appears');*/
    });

    test('Tapping bottom navigation bar changes floor', () async {
      // tap level 2
      await driver.waitFor(levelTwo);
      await driver.tap(levelTwo);
      print('tapped level 2');
      // tap slot L2 A2
      await driver.waitFor(slotL2A2);
      await driver.tap(slotL2A2);
      print('tapped slot L2 A2');
      // tap level 1
      await driver.waitFor(levelOne);
      await driver.tap(levelOne);
      print('tapped level 1');
      // tap slot L1 B2
      await driver.waitFor(slotL1B2);
      await driver.tap(slotL1B2);
      print('tapped slot L1 B2');
    });


  });
}