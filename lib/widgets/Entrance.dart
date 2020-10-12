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
class Entrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: layoutSize.blockSizeVertical * 8,
      width: layoutSize.blockSizeHorizontal * 25,
      alignment: Alignment(0.0, 0.0),
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