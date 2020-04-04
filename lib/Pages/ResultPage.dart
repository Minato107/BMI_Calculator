import 'package:flutter/material.dart';
import '../Components/Constants.dart';
import '../Components/CardSpace.dart';
import 'InputPage.dart';
class ResultPage extends StatelessWidget {
  final String calculatedBMI;
  final String resultText;
  final String textMessage;
  ResultPage({this.calculatedBMI,this.resultText,this.textMessage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child:Text(
                'Your Result',
                style: kIconTextStyle.copyWith(
                  fontSize: 38,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardSpace(
                colour: kDablyaver,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      calculatedBMI,
                      style: kNoTextStyle,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Normal BMI range:',
                          style: kLableTextStyle,
                        ),
                        Text(
                          ''
                        ),
                        Text(
                          '18.5-25 kg/m2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      textMessage,
                      style: kLableTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              actionTaken: (){
                Navigator.pushNamed(context,'/');
              },
              buttonHeading: 'RE-CALCULATE',
            ),
          ],
        )
    );
  }
}
