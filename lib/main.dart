import 'package:flutter/material.dart';
import 'layoutSize.dart';
import 'package:flutter/widgets.dart';
import 'utils/constants.dart';
import 'widgets/Road.dart';
import 'widgets/EmptyBox.dart';
import 'widgets/Entrance.dart';
import 'widgets/ParkingSlot.dart';
import 'package:firebase_core/firebase_core.dart';


/*
  Main script for web dashboard. Dashboard shows the parking slots available on
  both floors. Green indicates available, and red indicates taken.

  The bottom menu bar allows users to switch between the floors.
  Clicking on a parking slot will indicate the availability of the slot in a
  snackbar. Clicking on an available parking slot will also produce arrow directions
  from the entrance to the parking slot.

  Created August 2020
  by Bee Khee Siang
  Modified 8th October 2020
  by Aqeel Ahlam Rauf
*/

/** GENERAL NOTES:
 * 1. StatelessWidget: The State of the widget CANNOT change over time,
 * once it has been initialized, everything inside it, including the data
 * cannot be changed
 *
 * 2. StatefulWidget: The State of the widget CAN change over time.
 */


/// This is the first line of code that will run as we start the app
//void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// Root Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Returning a wrapper widget
    return MaterialApp(
      title: 'Smart Car Park',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.black54),
      home: MyHomePage(title: 'Smart Car Park'), /// This is the widget that is running on the home screen
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
          ),
        ),
      ),

      /// Gets the layout of the correct floor
      body: new _FloorLayout()._getFloorLayout(_selectedIndex),
      /// Contents of the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
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

  /// List containing the different layouts
  static List<Card> _layoutOptions = <Card>[
    /// PARKING SLOTS FOR LEVEL 1
    Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.black45,
        child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyBox(),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//                  EmptyBox(),
//                  ParkingSlots('L1_A1', SIDE_A),
                  ParkingSlot('L1_A1', SIDE_A),
//                  CustomPaint(
//                    painter: ShapePainter(1),
//                  ),
                  ParkingSlot('L1_B1', SIDE_B),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ParkingSlot('L1_A2', SIDE_A),
//                  Road(),
//                  CustomPaint(
//                    painter: ShapePainter(2),
//                  ),
                  ParkingSlot('L1_B2', SIDE_B),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ParkingSlot('L1_A3', SIDE_A),
                  ParkingSlot('L1_B3', SIDE_B),
//                  ParkingSlot(false, 'A3', SIDE_A),
//                  Road(),
//                  CustomPaint(
//                    painter: ShapePainter(3),
//                  ),
//                  ParkingSlot(false, 'B3', SIDE_B),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ParkingSlot('L1_A4', SIDE_A),
                  ParkingSlot('L1_B4', SIDE_B),
//                  ParkingSlot(true, 'A4', SIDE_A),
//                  Road(),
//                  CustomPaint(
//                    painter: ShapePainter(4),
//                  ),
//                  ParkingSlot(false, 'B4', SIDE_B),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyBox(),
                ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Entrance(),
                ],)
        ]
      )
    ),

    /// PARKING SLOTS FOR LEVEL 2
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
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot('L2_A1', SIDE_A),
              Road(),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot('L2_A2', SIDE_A),
              Road(),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot('L2_A3', SIDE_A),
              Road(),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParkingSlot('L2_A4', SIDE_A),
              Road(),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyBox(),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Entrance(),
            ],)
        ]
        )
    ),
  ];

/// This Function is used to return the layout index (CARD index)
/// Each Card holds the slots for one level of parking
  Card _getFloorLayout(int index) {
    /// Function that returns the layout (CARD INDEX)
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

