import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../mission_selection.dart';




class ButtonWidget extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Color textColor;
  double width;
  double height;
  ButtonWidget(this.buttonText,this.buttonColor,this.textColor, this.width,this.height);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => MissionSelectionScreen(buttonText)));
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
        surfaceTintColor: Colors.black,

        backgroundColor:buttonColor,
        fixedSize: Size(width, height),
      ), label: Text(''),
    );
  }
}





