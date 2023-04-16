import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';
class Bottombutton extends StatelessWidget {

  final Function ontap;
  final String buttontitle ;
  const Bottombutton({ @required this.ontap,@required this.buttontitle
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          color: Color(0XFFEB1555),
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: 50,
          child: Center(child: Text(buttontitle),
          ),
        ));
  }
}