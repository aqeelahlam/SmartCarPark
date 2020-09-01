import 'package:flutter/material.dart';
import 'layoutSize.dart';
import 'package:flutter/widgets.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
    body: Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyBox(),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        ParkingSlot(true, 'A1', 'car_A'),
        Road(),
        ParkingSlot(false, 'B1', 'car_B'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ParkingSlot(true, 'A2', 'car_A'),
          Road(),
          ParkingSlot(true, 'B2', 'car_B'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ParkingSlot(false, 'A3', 'car_A'),
          Road(),
          ParkingSlot(false, 'B3', 'car_B'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ParkingSlot(false, 'A4', 'car_A'),
          Road(),
          ParkingSlot(true, 'B4', 'car_B'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ParkingSlot(true, 'A5', 'car_A'),
          Road(),
          ParkingSlot(true, 'B5', 'car_B'),
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
    );
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
      return Container(
        height: layoutSize.blockSizeVertical * 12,
        width: layoutSize.blockSizeHorizontal * 30,
//        width: 250,
//        height: 100,
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
      );
    }
    else {
      return Container(
        height: layoutSize.blockSizeVertical * 12,
        width: layoutSize.blockSizeHorizontal * 30,
//        width: 250,
//        height: 100,
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

