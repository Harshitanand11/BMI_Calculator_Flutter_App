import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
class iconContent extends StatelessWidget {
  iconContent({this.icon,this.label}) ;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size:80,
        ),
        SizedBox(
          height: 15,
        ),
        Text( label,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}