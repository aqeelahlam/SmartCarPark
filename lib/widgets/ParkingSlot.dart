import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/layoutSize.dart';
import '../Slots.dart';
import '../main.dart';

/// This is a Stateless widget used to draw a shape of the
/// Entrance on the User Interface.
/// The widget is Immutable and will not change after it has been drawn.
///
/// Created August 2020
/// by Bee Khee Siang
/// Modified October 2020
/// by Aqeel Ahlam Rauf
///
class ParkingSlot extends StatefulWidget {
  // StatelessWidget of the Parking slot
  String slotNumber;
  String rowNumber;

  // Constructor of a parking slot
  ParkingSlot(slotNumber, rowNumber) {
    this.slotNumber = slotNumber;
    this.rowNumber = rowNumber;
  }

  @override
  _ParkingSlotState createState() => _ParkingSlotState();
}

class _ParkingSlotState extends State<ParkingSlot> {

  bool current_status;
  Slots slot;
  Slots finalOne;
  List documents;

  Slots check_status(String slotNum) {

    CollectionReference slots = Firestore.instance.collection('slots');
    slots.getDocuments().then((snapshot) {
      snapshot.documents.forEach((doc) {
        if (doc.documentID == slotNum) {
          setState(() {
            current_status = doc.data()['status'];
          });
//          slot.status = doc.data()['status'];
//          current_status = doc.data()['status'];
//          print(current_status);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    // if the parking slot is available
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
//    print(check_status(widget.slotNumber));
//    print(widget.slotNumber);
//    finalOne = check_status(widget.slotNumber);
//    print(current_status);

    if (current_status == false) {
      // if the parking slot is occupied
      return GestureDetector( //onclick produces flushbar with details of parking slot
        onTap: () {
          Flushbar(
            title: "Parking Slot: " + widget.slotNumber,
            message: "Status: Available",
            flushbarStyle: FlushbarStyle.FLOATING,
            margin: EdgeInsets.all(8),
            borderRadius: 8,
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.blue[300],
            ),
            duration: Duration(seconds: 3),
            leftBarIndicatorColor: Colors.blue[300],
          )
            ..show(context);

          CustomPaint(
            painter: ShapePainter(1),
          );
        },
        child: Container(
//          height: queryData.size.height/6,
//          width: queryData.size.width/4,
          height: layoutSize.blockSizeVertical * 12,
          width: layoutSize.blockSizeHorizontal * 30,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(),
            image: DecorationImage(
              image: AssetImage('assets/images/noun_Parking_2313077.png'),
            ),
          ),
          child: new Text(widget.slotNumber,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
        ),
      );
    }

    else {
      return GestureDetector(
          onTap: () {
            Flushbar(
              title: "Parking Slot: " + widget.slotNumber,
              message: "Status: Occupied",
              flushbarStyle: FlushbarStyle.FLOATING,
              margin: EdgeInsets.all(8),
              borderRadius: 8,
              icon: Icon(
                Icons.info_outline,
                size: 28.0,
                color: Colors.blue[300],
              ),
              duration: Duration(seconds: 3),
              leftBarIndicatorColor: Colors.blue[300],
            )
              ..show(context);
          },
          child: Container(
//            height: queryData.size.height/6,
//            width: queryData.size.width/4,
            height: layoutSize.blockSizeVertical * 12,
            width: layoutSize.blockSizeHorizontal * 30,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(),
              image: DecorationImage(
                image: AssetImage('assets/images/' + widget.rowNumber + '.png'),
              ),
            ),
            child: new Text(widget.slotNumber,
              style: TextStyle(
                  fontSize: 20.0
              ),
            ),
          )
      );
    }
  }
}