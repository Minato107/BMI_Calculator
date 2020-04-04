import 'package:flutter/material.dart';
import '../Components//Constants.dart';

class GenderCard extends StatelessWidget {
  final Icon genderCon;
  final String genderText;
  GenderCard({this.genderCon,this.genderText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        genderCon,
        SizedBox(
          height: 20,
        ),
        Text(genderText, style: kLableTextStyle),
      ],
    );
  }
}

