import 'package:flutter/cupertino.dart';

/// This is a Stateless widget used to draw the road Image on
/// the User Interface.
/// The widget is Immutable and will not change after it has been drawn.
///
/// Created August 2020
/// by Bee Khee Siang
///
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
