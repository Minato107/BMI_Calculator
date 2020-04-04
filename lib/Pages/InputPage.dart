import 'package:bmi_calculator/Logic/CalculateBmi.dart';
import 'package:bmi_calculator/Pages/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//constants
import '../Components/Constants.dart';
//pages
import '../Components/General Card.dart';
import '../Components/CardSpace.dart';

class InputPage extends StatefulWidget {
  @override
  InputPageState createState() => InputPageState();
}

enum Cal{
  Plus,Minus
}
enum Gender{
  Male, Female
}
class InputPageState extends State<InputPage> {
Cal selectOps;
  Gender selectGender;
  int height=160;
  int weight=60;
  int age=25;
  void calculateByIcon(selectOps){
setState(() {
if(selectOps==Cal.Minus){
if(weight!=0)
{weight--;}}
if(selectOps==Cal.Plus){
if(weight!=120)
{weight++;}}
});
}

void calculateAge(selectOps){
  setState(() {
    if(selectOps==Cal.Minus){
      if(age!=0)
      {age--;}}
    if(selectOps==Cal.Plus){
      if(age!=100)
      {age++;}}
  });
}
  void male(){
  setState(() {
  selectGender =Gender.Male;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardSpace(
                    colour:(selectGender==Gender.Male)?(kDablyaver):(kMagcha),
                    changeColor: (){
                      setState(() {
                        selectGender=Gender.Male;
                      });
                    },
                    cardChild: GenderCard(genderCon:Icon(AntDesign.man,size: 100),genderText:'MALE'),
                    ),
                ),
                Expanded(
                          child: CardSpace(
                            colour:(selectGender==Gender.Female)?(kDablyaver):(kMagcha),
                            changeColor:(){
                              setState(() {
                                selectGender=Gender.Female;
                                  });
                                },
                            cardChild: GenderCard(genderCon:Icon(AntDesign.woman,size: 100),genderText:'FEMALE'),
                          ),
                ),
           ],
        ),
          ),
          Expanded(
            child: CardSpace(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Height',style:kLableTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNoTextStyle,
                      ),
                      Text(
                        'CM',
                      ),
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                    thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white ,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 200,
                      onChanged: (double newvalue){
                        setState(() {
                          height=newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour:kMagcha,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardSpace(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                         'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                        weight.toString(),
                        style: kNoTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                           calculateAction:() {
                            calculateByIcon(Cal.Minus);}
                            ,givenIcon:Icon(AntDesign.minus,size: 40,color: Colors.white)
                            ),
                            IconButton(
                                calculateAction:() {
                                  calculateByIcon(Cal.Plus);}
                                ,givenIcon:Icon(AntDesign.plus,size: 40,color: Colors.white)
                            ),
                          ],
                        )
                      ],
                    ),
                    colour:kMagcha,
                  ),
                ),
                Expanded(
                  child: CardSpace(
                    colour:kMagcha,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNoTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                                calculateAction:() {
                                  calculateAge(Cal.Minus);}
                                ,givenIcon:Icon(AntDesign.minus,size: 40,color: Colors.white)
                            ),
                            IconButton(
                                calculateAction:() {
                                  calculateAge(Cal.Plus);}
                                ,givenIcon:Icon(AntDesign.plus,size: 40,color: Colors.white)
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(actionTaken: (){
            CalculateBmi cal =CalculateBmi(height: height,weight: weight);
            Navigator.push(context,MaterialPageRoute(
              builder: (context)=>ResultPage(
                calculatedBMI: cal.calculate(),
              resultText: cal.getResult(),
              textMessage: cal.getMessage())
            )
            );
          },
           buttonHeading: 'CALCULATE',)
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function actionTaken;
  final String buttonHeading;
  BottomButton({this.actionTaken,this.buttonHeading});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionTaken,
      child: Container(
        child: Center(
          child: Text(
            buttonHeading,
            style: kResultTextStyle,
          ),
        ),
        height: 50,
        color: Color(0xFFEB1555),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  IconButton({this.calculateAction,this.givenIcon});
Icon givenIcon;
Function calculateAction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: calculateAction,
      child: CircleAvatar(
        backgroundColor: kIconMagcha,
        child: givenIcon,
        radius: 30,
      ),
    );
  }
}