import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/iconContent.dart';
import 'package:bmi_calculator/components/resusablecard.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/bottombutton.dart';
import 'package:bmi_calculator/components/RoundIconbutton.dart';
import 'package:bmi_calculator/Calculator_brain.dart';

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
     int weight = 60;
     int age =20;
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
                    cardChild: iconContent( icon:FontAwesomeIcons.venus, label: 'FEMALE',),
                  ),

                ),
            ],
          ),

          ),
          Expanded(child: Reusablecard(
            colour: kActiveCardColour,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text('HEIGHT', style: klabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [Text(height.toString(),
                    style: kNumberTextStyle
                ),
                Text('cm',style: klabelTextStyle),

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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style:klabelTextStyle,
                          ),
                      Text(
                          weight.toString(),
                        style:kNumberTextStyle,
                       ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus ,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),

                          SizedBox(width: 10,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },

                          )
                        ],
                      )
                    ],
                  ),
                )),

              Expanded(
                child: Reusablecard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',style: klabelTextStyle),
                      Text(
                        age.toString(),
                        style:kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus ,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),

                          SizedBox(width: 10,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },

                          )
                        ],

                      )


                    ],
                  ),
                )
              ),
            ],
          ), ),
          Bottombutton(
            ontap:
                (){
              CalculatorBrain calc =CalculatorBrain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder:(context) => ResultPage(
                bmiResult: calc.calculateBmi(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ))

              );

            },
            buttontitle:  'Calculate',



          )
        ],

      ),

    );
  }}






