import 'package:flutter/material.dart';

class CardSpace extends StatelessWidget {
  CardSpace({this.colour,this.changeColor ,this.cardChild});
  final Function changeColor;
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context,) {
    return GestureDetector(
      onTap: changeColor ,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}