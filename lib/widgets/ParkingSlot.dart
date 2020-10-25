import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/layoutSize.dart';
import 'package:myapp/utils/constants.dart';
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

  // Stateful Widget of the Parking slot
  String slotNumber;
  String rowNumber;

  // Constructor of a parking slot
  ParkingSlot({
    Key key,
    @required this.slotNumber,
    @required this.rowNumber})
      : super(key: key);

  @override
  _ParkingSlotState createState() => _ParkingSlotState();
}

class _ParkingSlotState extends State<ParkingSlot> {

  bool currentStatus;
  //int counter = 0; // used for checking number of reads to firebase

  @override
  void initState() {
    //checkStatus(widget.slotNumber);  // check slot status from firebase
    super.initState();
  }

  void checkStatus(String slotNum) {
    // initialises a stream that listens for changes in data from Firebase document
    Stream<DocumentSnapshot> documentStream = FirebaseFirestore.instance
        .collection('slots')
        .doc(slotNum)
        .snapshots();
    documentStream.listen((snapshot) {
      if (this.mounted) {
        setState(() {
          currentStatus = snapshot.data()['status'];
          //counter += 1;
        });
        //print(DateTime.now().toString() + ': ' + widget.slotNumber + ': ' + counter.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // if the parking slot is available
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    if (currentStatus == false) {
      // if the parking slot is available
      return GestureDetector( //onclick produces flushbar with details of parking slot
        //key: Key("flushbar" + widget.slotNumber),
        onTap: () {
          Flushbar(
            //key: Key('flushbar' + widget.slotNumber),
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
        },
        child: Padding(
          padding: const EdgeInsets.all(PADDING2),
          child: Container(
//          height: queryData.size.height/6,
//          width: queryData.size.width/4,
            height: layoutSize.blockSizeVertical * 12,
            width: layoutSize.blockSizeHorizontal * 30,
            decoration: BoxDecoration(
              color: Colors.green[600],
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage('assets/images/noun_Parking_2313077.png'),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(PADDING),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.slotNumber,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Lato',
                  ),
                ),
              ),
            )
          ),
        )
      );
    }

    else {
      // if the parking slot is occupied
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
          child: Padding(
            padding: const EdgeInsets.all(PADDING2),
            child: Container(
//            height: queryData.size.height/6,
//            width: queryData.size.width/4,
              height: layoutSize.blockSizeVertical * 12,
              width: layoutSize.blockSizeHorizontal * 30,
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage('assets/images/' + widget.rowNumber + '.png'),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(PADDING),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.slotNumber,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Lato'
                    ),
                  ),
                )
            ),
            ),
          )
      );
    }
  }
}