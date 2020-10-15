
//class ParkingSlots extends StatefulWidget{
//
//  String slotNumber;
//  String rowNumber;
//
//  ParkingSlots({this.slotNumber, this.rowNumber});
////  ParkingSlots(String slotNumber, String rowNumber);
//
//  @override
//  State<StatefulWidget> createState() {
//    _ParkingSlots(slotNumber, rowNumber);
//  }
//
//}
//
//class _ParkingSlots extends State<ParkingSlots>{
//  bool occupied;
//  String slotNumber;
//  String rowNumber;
//
//  _ParkingSlots(String slotNumber, String rowNumber);
//
//  List documents;
//  Map current;
//
//  bool check_status(String slotNum){
//    int position;
//    CollectionReference collectionReference = Firestore.instance.collection('slots');
//    collectionReference.snapshots().listen((snapshot) {
//      setState(() {
//        documents = snapshot.documents;
//        for(int i = 0; i<documents.length ; i++){
//          if(documents[i].toString() == slotNum){
//            position = i;
//          }
//        }
//        current = documents[position].data();
//      });
//    });
//    return current['status'];
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    // if the parking slot is available
//    MediaQueryData queryData;
//    queryData = MediaQuery.of(context);
//
//
//
//    if (check_status(slotNumber) == false){
//      return GestureDetector( //onclick produces flushbar with details of parking slot
//        onTap: () {
//          Flushbar(
//            title: "Parking Slot: " + slotNumber,
//            message: "Status: Available",
//            flushbarStyle: FlushbarStyle.FLOATING,
//            margin: EdgeInsets.all(8),
//            borderRadius: 8,
//            icon: Icon(
//              Icons.info_outline,
//              size: 28.0,
//              color: Colors.blue[300],
//            ),
//            duration: Duration(seconds: 3),
//            leftBarIndicatorColor: Colors.blue[300],
//          )..show(context);
//          },
//        child: Container(
////          height: queryData.size.height/6,
////          width: queryData.size.width/4,
//          height: layoutSize.blockSizeVertical * 12,
//          width: layoutSize.blockSizeHorizontal * 30,
//          decoration: BoxDecoration(
//            color: Colors.green,
//            border: Border.all(),
//            image: DecorationImage(
//              image: AssetImage('assets/images/noun_Parking_2313077.png'),
//            ),
//          ),
//          child: new Text(slotNumber,
//            style: TextStyle(
//                fontSize: 20.0
//            ),
//          ),
//        ),
//      );
//    }
//    else {
//      // if the parking slot is occupied
//      return GestureDetector(
//          onTap: () {
//            Flushbar(
//              title: "Parking Slot: " + slotNumber,
//              message: "Status: Occupied",
//              flushbarStyle: FlushbarStyle.FLOATING,
//              margin: EdgeInsets.all(8),
//              borderRadius: 8,
//              icon: Icon(
//                Icons.info_outline,
//                size: 28.0,
//                color: Colors.blue[300],
//              ),
//              duration: Duration(seconds: 3),
//              leftBarIndicatorColor: Colors.blue[300],
//            )..show(context);
//          },
//          child: Container(
////            height: queryData.size.height/6,
////            width: queryData.size.width/4,
//            height: layoutSize.blockSizeVertical * 12,
//            width: layoutSize.blockSizeHorizontal * 30,
//            decoration: BoxDecoration(
//              color: Colors.red,
//              border: Border.all(),
//              image: DecorationImage(
//                image: AssetImage('assets/images/' + rowNumber + '.png'),
//              ),
//            ),
//            child: new Text(slotNumber,
//              style: TextStyle(
//                  fontSize: 20.0
//              ),
//            ),
//          )
//      );
//    }
//  }
//}


/// Original

//class ParkingSlot extends StatelessWidget {
//  // StatelessWidget of the Parking slot
//  bool occupied;
//  String slotNumber;
//  String rowNumber;
//
//  // Constructor of a parking slot
//  ParkingSlot(bool occupied, slotNumber, rowNumber) {
//    this.occupied = occupied;
//    this.slotNumber = slotNumber;
//    this.rowNumber = rowNumber;
//  }
//
////  void update(){
////    CollectionReference collectionReference = Firestore.instance.collection('slots');
////    collectionReference.snapshots().listen((snapshot) {
////      setState
////    });
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    // if the parking slot is available
//    MediaQueryData queryData;
//    queryData = MediaQuery.of(context);
//
//    if (occupied == false){
//      return GestureDetector( //onclick produces flushbar with details of parking slot
//        onTap: () {
//          Flushbar(
//            title: "Parking Slot: " + slotNumber,
//            message: "Status: Available",
//            flushbarStyle: FlushbarStyle.FLOATING,
//            margin: EdgeInsets.all(8),
//            borderRadius: 8,
//            icon: Icon(
//              Icons.info_outline,
//              size: 28.0,
//              color: Colors.blue[300],
//            ),
//            duration: Duration(seconds: 3),
//            leftBarIndicatorColor: Colors.blue[300],
//          )..show(context);
//
//          CustomPaint(
//              painter: ShapePainter(1),
//            );},
//        child: Container(
////          height: queryData.size.height/6,
////          width: queryData.size.width/4,
//          height: layoutSize.blockSizeVertical * 12,
//          width: layoutSize.blockSizeHorizontal * 30,
//            decoration: BoxDecoration(
//              color: Colors.green,
//              border: Border.all(),
//              image: DecorationImage(
//                image: AssetImage('assets/images/noun_Parking_2313077.png'),
//              ),
//            ),
//          child: new Text(slotNumber,
//            style: TextStyle(
//                fontSize: 20.0
//            ),
//          ),
//        ),
//      );
//    }
//    else {
//      // if the parking slot is occupied
//      return GestureDetector(
//          onTap: () {
//            Flushbar(
//              title: "Parking Slot: " + slotNumber,
//              message: "Status: Occupied",
//              flushbarStyle: FlushbarStyle.FLOATING,
//              margin: EdgeInsets.all(8),
//              borderRadius: 8,
//              icon: Icon(
//                Icons.info_outline,
//                size: 28.0,
//                color: Colors.blue[300],
//              ),
//              duration: Duration(seconds: 3),
//              leftBarIndicatorColor: Colors.blue[300],
//            )..show(context);
//            },
//          child: Container(
////            height: queryData.size.height/6,
////            width: queryData.size.width/4,
//            height: layoutSize.blockSizeVertical * 12,
//            width: layoutSize.blockSizeHorizontal * 30,
//            decoration: BoxDecoration(
//              color: Colors.red,
//              border: Border.all(),
//              image: DecorationImage(
//                image: AssetImage('assets/images/' + rowNumber + '.png'),
//              ),
//            ),
//            child: new Text(slotNumber,
//              style: TextStyle(
//                  fontSize: 20.0
//              ),
//            ),
//          )
//      );
//    }
//  }
//}

/// Final

//class ParkingSlot extends StatefulWidget {
//  // StatelessWidget of the Parking slot
//  String slotNumber;
//  String rowNumber;
//
//  // Constructor of a parking slot
//  ParkingSlot(slotNumber, rowNumber) {
//    this.slotNumber = slotNumber;
//    this.rowNumber = rowNumber;
//  }
//
//  @override
//  _ParkingSlotState createState() => _ParkingSlotState();
//}
//
//class _ParkingSlotState extends State<ParkingSlot> {
//
//  bool current_status;
//  Slots slot;
//  Slots finalOne;
//
//  Slots check_status(String slotNum) {
//    CollectionReference slots = Firestore.instance.collection('slots');
//    slots.getDocuments().then((snapshot) {
//      snapshot.documents.forEach((doc) {
//        if (doc.documentID == slotNum) {
//          setState(() {
//            current_status = doc.data()['status'];
//          });
////          slot.status = doc.data()['status'];
////          current_status = doc.data()['status'];
////          print(current_status);
//        }
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    // if the parking slot is available
//    MediaQueryData queryData;
//    queryData = MediaQuery.of(context);
////    print(check_status(widget.slotNumber));
////    print(widget.slotNumber);
//    finalOne = check_status(widget.slotNumber);
//    print(current_status);
//
//    if (current_status == false) {
//      // if the parking slot is occupied
//      return GestureDetector( //onclick produces flushbar with details of parking slot
//        onTap: () {
//          Flushbar(
//            title: "Parking Slot: " + widget.slotNumber,
//            message: "Status: Available",
//            flushbarStyle: FlushbarStyle.FLOATING,
//            margin: EdgeInsets.all(8),
//            borderRadius: 8,
//            icon: Icon(
//              Icons.info_outline,
//              size: 28.0,
//              color: Colors.blue[300],
//            ),
//            duration: Duration(seconds: 3),
//            leftBarIndicatorColor: Colors.blue[300],
//          )
//            ..show(context);
//
//          CustomPaint(
//            painter: ShapePainter(1),
//          );
//        },
//        child: Container(
////          height: queryData.size.height/6,
////          width: queryData.size.width/4,
//          height: layoutSize.blockSizeVertical * 12,
//          width: layoutSize.blockSizeHorizontal * 30,
//          decoration: BoxDecoration(
//            color: Colors.green,
//            border: Border.all(),
//            image: DecorationImage(
//              image: AssetImage('assets/images/noun_Parking_2313077.png'),
//            ),
//          ),
//          child: new Text(widget.slotNumber,
//            style: TextStyle(
//                fontSize: 20.0
//            ),
//          ),
//        ),
//      );
//    }
//
//    else {
//      return GestureDetector(
//          onTap: () {
//            Flushbar(
//              title: "Parking Slot: " + widget.slotNumber,
//              message: "Status: Occupied",
//              flushbarStyle: FlushbarStyle.FLOATING,
//              margin: EdgeInsets.all(8),
//              borderRadius: 8,
//              icon: Icon(
//                Icons.info_outline,
//                size: 28.0,
//                color: Colors.blue[300],
//              ),
//              duration: Duration(seconds: 3),
//              leftBarIndicatorColor: Colors.blue[300],
//            )
//              ..show(context);
//          },
//          child: Container(
////            height: queryData.size.height/6,
////            width: queryData.size.width/4,
//            height: layoutSize.blockSizeVertical * 12,
//            width: layoutSize.blockSizeHorizontal * 30,
//            decoration: BoxDecoration(
//              color: Colors.red,
//              border: Border.all(),
//              image: DecorationImage(
//                image: AssetImage('assets/images/' + widget.rowNumber + '.png'),
//              ),
//            ),
//            child: new Text(widget.slotNumber,
//              style: TextStyle(
//                  fontSize: 20.0
//              ),
//            ),
//          )
//      );
//    }
//  }
//}