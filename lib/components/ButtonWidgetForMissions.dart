import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../mission_selection.dart';




class ButtonWidgetForMission extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Color textColor;
  double width;
  double height;
  ButtonWidgetForMission(this.buttonText,this.buttonColor,this.textColor, this.width,this.height);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
      },
      icon: Padding(
        padding: EdgeInsets.only(left: 14),
        child: Text(buttonText,
            style: TextStyle(color: textColor, fontSize: 20)),
        /*FaIcon(
          FontAwesomeIcons.facebook,
          color: Colors.white,
        ),*/
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor:buttonColor,
        fixedSize: Size(width, height),
      ), label: Text(''),
    );
  }
}





