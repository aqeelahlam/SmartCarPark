import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/widgets/ParkingSlot.dart';
import 'package:flushbar/flushbar.dart';

void main () {
  // also doesn't work here
/*  group('Flushbar Test', () {
    testWidgets('Flushbar exists if slot tapped', (WidgetTester tester) async {
      await tester.pumpWidget(ParkingSlot('L1_A1', 'car_A'));
      await tester.tap(find.byType(ParkingSlot));
      await tester.pump();
      expect(find.text('Status'), findsOneWidget);
      //expect(find.byType(Flushbar), findsOneWidget);
    });
  });*/

  // https://pub.dev/packages/cloud_firestore_mocks/install

  // methods for ParkingSlot.dart if you want to test checkStatus method
/*  void setStatus(String slotNum) {

    bool status = CheckStatus().getStatus(slotNum);
    if (this.mounted) {
      setState(() {
        // update status of parking slot
        current_status = status;
      });
    }
  }

  class CheckStatus {

  bool getStatus(slotNumber) {
  bool status;
  // get the document related to this parking slot
  FirebaseFirestore.instance
      .collection('slots')
      .doc(slotNumber)
      .get()
      .then((doc) {
  // get the status
  status = doc.data()['status'];
  });
  return status;
  }

  }*/

}