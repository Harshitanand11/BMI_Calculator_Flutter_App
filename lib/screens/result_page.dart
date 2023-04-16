import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/components/resusablecard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/bottombutton.dart';


class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text('BMI CALCULATOR'),

      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child:Container(
            child: Text('Your Result',

              style: kTitleTextStyle,
            ),
          ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecard(colour: kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(resultText,
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(bmiResult,
                      textAlign: TextAlign.center,
                      style: kBmitextstyle),
                  Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kbodytextstyle,),


                ],
              ),
            ),
          ),
          Bottombutton( buttontitle:'Re-Calculate',ontap:(){
            Navigator.pop(context);
          },)
        ],

      ),
    );

  }
}
