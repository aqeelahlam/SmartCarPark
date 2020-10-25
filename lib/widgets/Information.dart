import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../layoutSize.dart';

/// This is a Stateless widget used to draw the road Image on
/// the User Interface.
/// The widget is Immutable and will not change after it has been drawn.
///
/// Created August 2020
/// by Bee Khee Siang
///
class Information extends StatefulWidget {
  // Stateful Widget for information

  String info;

  Information(this.info, this.iconPath);

  String iconPath;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: layoutSize.blockSizeVertical * 5,
      width: layoutSize.blockSizeHorizontal * 18,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage('assets/images/' + widget.iconPath + '.png'),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.info,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
      ),
      )
    );
  }
}
