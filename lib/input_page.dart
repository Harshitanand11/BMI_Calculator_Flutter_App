import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'resusablecard.dart';
import 'Constants.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female

}

class _InputPageState extends State<InputPage> {

     Gender selectedgender;

     int height=180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: Reusablecard(
                  onPress:(){
                    setState(() {
                      selectedgender=Gender.male;
                    });
                  } ,
                  colour: selectedgender == Gender.male ? kActiveCardColour:kInactiveCardColour,
                  cardChild: iconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                ),),

                Expanded(
                  child: Reusablecard(
                    onPress: (){
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    colour: selectedgender == Gender.female? kActiveCardColour:kInactiveCardColour,
                    cardChild: iconContent( icon:FontAwesomeIcons.venus,label: 'FEMALE',),
                  ),

                ),
            ],
          ),

          ),
          Expanded(child: Reusablecard(
            colour: kActiveCardColour,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('HEIGHT', style: labelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [Text(height.toString(),
                    style: kNumberTextStyle
                ),
                Text('cm',style: labelTextStyle),

                ],

              ),
                SliderTheme(
                  data:SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
    overlayColor: Color(0X29EB1555),
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),

                      child: Slider(value: height.toDouble(),
                        min:120,
                        max:220,

                        inactiveColor: Colors.grey,
                        onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                          print(newValue);
                        }),
                    ),

              ],

            ) ,
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                child: Reusablecard(
                  colour: kActiveCardColour,

                  
                )),

              Expanded(
                child: Reusablecard(
                  colour: kActiveCardColour,
                )
              ),
            ],
          ), ),
          Container(
            color: Color(0XFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 50,
            child: Center(child: Text('Calculate', style: TextStyle(
              fontSize: 24,
            ), )),
          )
        ],

      ),

    );
  }}



