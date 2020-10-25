import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../layoutSize.dart';

/// This is a Stateless widget used to draw a shape of the
/// Entrance on the User Interface.
/// The widget is Immutable and will not change after it has been drawn.
///
/// Created August 2020
/// by Bee Khee Siang
///
class Entrance extends StatefulWidget {

  String EntranceName;
  double height;


  Entrance(this.EntranceName, this.height);


  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: layoutSize.blockSizeVertical * widget.height,
//      width: layoutSize.blockSizeHorizontal * 30,
      width: queryData.size.width * 0.30,
      alignment: Alignment(0.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(widget.EntranceName, style: TextStyle(fontFamily: 'Lato', color: Colors.white)),
      ),
//      child: new Text(widget.EntranceName,
//        style: TextStyle(
//
//          fontSize: 20.0,
//          fontFamily: 'Lato',
//          color: Colors.white,
//        ),
//      ),
    );
  }
}