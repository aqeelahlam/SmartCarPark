import 'package:flutter/material.dart';

/// This is a Stateless widget used to draw a shape of an Empty slot
/// on the User Interface.
/// The widget is Immutable and will not change after it has been drawn.
///
/// Created August 2020
/// by Bee Khee Siang
///
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