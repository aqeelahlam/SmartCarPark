import 'package:flutter/material.dart';
import 'layoutSize.dart';
import 'package:flutter/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:math';

/*
  Main script for web dashboard. Dashboard shows the parking slots available on
  both floors. Green indicates available, and red indicates taken.

  The bottom menu bar allows users to switch between the floors.
  Clicking on a parking slot will indicate the availability of the slot in a
  snackbar. Clicking on an available parking slot will also produce arrow directions
  from the entrance to the parking slot.

  Created August 2020
  by Bee Khee Siang
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Car Park',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.black54),
      home: MyHomePage(title: 'Smart Car Park'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onFloorTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    layoutSize().init(context);
    return new Scaffold(
        appBar: new AppBar(
        backgroundColor: Colors.black54,
          title: const Text('Smart Car Park',
            style: TextStyle(
                fontSize: 35.0
            ),),
    ),
    body: new _FloorLayout()._getFloorLayout(_selectedIndex), //gets the layout of the correct floor
    bottomNavigationBar: BottomNavigationBar( //contents of the bottom navigation bar
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          title: Text('Ground Floor', style: TextStyle(color: Colors.white)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          title: Text('Level 1', style: TextStyle(color: Colors.white)),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      backgroundColor: Colors.black54,
      onTap: _onFloorTapped,
    ),
    );
  }
}


class _FloorLayout {
  // List containing the different layouts
  static List<Card> _layoutOptions =
    <Card>[
      Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.black45,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
//        ParkingSlot(true, 'A1', 'car_A'),
              ParkingSlot(false, 'A1', 'car_A'),
              CustomPaint(
                painter: ShapePainter(1),
              ),
//              Road(),
//        ParkingSlot(false, 'B1', 'car_B'),
              ParkingSlot(true, 'B1', 'car_B'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot(true, 'A2', 'car_A'),
//          ParkingSlot(false, 'A2', 'car_A'),
//              Road(),
//              CustomPaint(
//                painter: ShapePainter(2),
//              ),
              ParkingSlot(true, 'B2', 'car_B'),
//          ParkingSlot(false, 'B2', 'car_B'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot(false, 'A3', 'car_A'),
//          ParkingSlot(true, 'A3', 'car_A'),
//              Road(),
//              CustomPaint(
//                painter: ShapePainter(3),
//              ),
              ParkingSlot(false, 'B3', 'car_B'),
//          ParkingSlot(true, 'B3', 'car_B'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot(true, 'A4', 'car_A'),
//          ParkingSlot(false, 'A4', 'car_A'),
//              Road(),
//              CustomPaint(
//                painter: ShapePainter(4),
//              ),
              ParkingSlot(false, 'B4', 'car_B'),
//          ParkingSlot(true, 'B4', 'car_B'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Entrance(),
            ],
          )

        ]
      )
    ),

      Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.black45,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
    //        ParkingSlot(true, 'A1', 'car_A'),
              ParkingSlot(true, 'A1', 'car_A'),
              Road(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot(false, 'A2', 'car_A'),
            //          ParkingSlot(false, 'A2', 'car_A'),
              Road(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot(false, 'A3', 'car_A'),
            //          ParkingSlot(true, 'A3', 'car_A'),
              Road(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot(false, 'A4', 'car_A'),
            //          ParkingSlot(false, 'A4', 'car_A'),
              Road(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Entrance(),
            ],
          )

        ]
      )
    ),
  ];

  Card _getFloorLayout(int index) {
    // function that returns the layout
    return _layoutOptions.elementAt(index);
  }
}



class ShapePainter extends CustomPainter {
  int rowNumber;
  BuildContext context;
  ShapePainter(int rowNumber) {
    this.rowNumber = rowNumber;
  }


  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    var box_horizontal = layoutSize.blockSizeHorizontal * 30;
    var box_vertical = layoutSize.blockSizeVertical * 12;
    var vertical_length = (4 - rowNumber + 1) * box_vertical;
    var horizontal_length = (box_horizontal * 2);

    path.moveTo(0, vertical_length);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
    path.moveTo(-250,0);
    path.lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}







class Road extends StatelessWidget {
  // StatelessWidget of the road
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: layoutSize.blockSizeVertical * 12,
//      width: layoutSize.blockSizeHorizontal * 13,
    height: 100,
    width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/road.png'),
            fit: BoxFit.fill,),
        ),
      );
  }

}


class ParkingSlot extends StatelessWidget {
  // StatelessWidget of the Parking slot
  bool occupied;
  String slotNumber;
  String rowNumber;

  // Constructor of a parking slot
  ParkingSlot(bool occupied, slotNumber, rowNumber) {
    this.occupied = occupied;
    this.slotNumber = slotNumber;
    this.rowNumber = rowNumber;
  }
  @override
  Widget build(BuildContext context) {
    // if the parking slot is available
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    if (occupied == false){
      return GestureDetector( //onclick produces flushbar with details of parking slot
          onTap: () {
            Flushbar(
              title: "Parking Slot: " + slotNumber,
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
            )..show(context);

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
          child: new Text(slotNumber,
          style: TextStyle(
              fontSize: 20.0
            ),
          ),
        ),
      );
    }
    else {
      // if the parking slot is occupied
      return GestureDetector(
          onTap: () {
            Flushbar(
              title: "Parking Slot: " + slotNumber,
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
            )..show(context);
      },

      child: Container(
//        height: queryData.size.height/6,
//        width: queryData.size.width/4,
        height: layoutSize.blockSizeVertical * 12,
        width: layoutSize.blockSizeHorizontal * 30,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(),
          image: DecorationImage(
          image: AssetImage('assets/images/' + rowNumber + '.png'),
          ),
        ),
        child: new Text(slotNumber,
          style: TextStyle(
              fontSize: 20.0
            ),
          ),
        )
      );
    }
  }
}


class EmptyBox extends StatelessWidget {
  // StatelessWidget of an empty box. Used to fill up spaces for alignment purposes
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      height: 50,
      alignment: Alignment(0.0, -0.1),
    );
  }
}

class Entrance extends StatelessWidget {
  // StatelessWidget of the entrance
  @override
  Widget build(BuildContext context) {
    return Container(
      height: layoutSize.blockSizeVertical * 8,
      width: layoutSize.blockSizeHorizontal * 25,
      alignment: Alignment(0.0, -0.1),
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(),
      ),
      child: new Text('Entrance/Exit',
        style: TextStyle(
            fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

