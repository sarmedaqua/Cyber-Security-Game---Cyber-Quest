import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ethvid1.dart';
import '../mission_screens/ethical_hacker_missions/mission1_ethicalhacker.dart';
import '../mission_screens/security_analyst_missions/mission1_secanalyst.dart';
import '../secvid1.dart';


class Mission1Button extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Color textColor;
  double width;
  double height;
  String role;
  Mission1Button(this.buttonText,this.buttonColor,this.textColor, this.width,this.height, this.role);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        log(role);
      if(role == "Security Analyst") {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => Secvid1())); }

      if(role == "Ethical Hacker") {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => Ethvid1())); }

      // if(role == "Pen Tester") {
      //   Navigator.push(context,
      //       CupertinoPageRoute(builder: (context) => PenTesterMission1())); }

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





