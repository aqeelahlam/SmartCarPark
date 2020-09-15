import 'package:flutter/material.dart';
import 'layoutSize.dart';
import 'package:flutter/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Car Park',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.black54),
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      home: MyHomePage(title: 'Smart Car Park'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
        backgroundColor: Colors.black54,
          title: const Text('Smart Car Park',
            style: TextStyle(
                fontSize: 35.0
            ),),
    ),
    body: new _FloorLayout()._getFloorLayout(_selectedIndex),
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
                painter: ShapePainter(),
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
    return _layoutOptions.elementAt(index);
  }
}



class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();

//    var angle = (math.pi * 2) / sides;
//
//    Offset center = Offset(size.width / 2, size.height / 2);
//
//// startPoint => (100.0, 0.0)
//    Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
//
//    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
//
//    for (int i = 1; i <= sides; i++) {
//      double x = radius * math.cos(angle * i) + center.dx;
//      double y = radius * math.sin(angle * i) + center.dy;
//      path.lineTo(x, y);
//    }
//    path.close();

    path.moveTo(0, 350);
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
  bool occupied;
  String slotNumber;
  String rowNumber;
  ParkingSlot(bool occupied, slotNumber, rowNumber) {
    this.occupied = occupied;
    this.slotNumber = slotNumber;
    this.rowNumber = rowNumber;
  }
  @override
  Widget build(BuildContext context) {
    if (occupied == false){
      return GestureDetector(
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
          },
        child: Container(
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
      child: new Text('Entrance',
        style: TextStyle(
            fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

