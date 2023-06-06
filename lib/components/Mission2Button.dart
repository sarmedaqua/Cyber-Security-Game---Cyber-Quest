import 'package:cybersecurity_game_cyberquest/mission_screens/ethical_hacker_missions/mission2_ethicalhacker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ethvid2.dart';
import '../mission_screens/security_analyst_missions/mission2_secanalyst.dart';
import '../secvid2.dart';




class Mission2Button extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Color textColor;
  double width;
  double height;
  String role;
  Mission2Button(this.buttonText,this.buttonColor,this.textColor, this.width,this.height, this.role);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if(role == "Security Analyst") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => Secvid2())); }

        if(role == "Ethical Hacker") {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => Ethvid2())); }


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





