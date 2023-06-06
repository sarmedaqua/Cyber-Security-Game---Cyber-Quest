import 'package:cybersecurity_game_cyberquest/components/Mission1Button.dart';
import 'package:cybersecurity_game_cyberquest/components/Mission2Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MissionSelectionScreen extends StatefulWidget {
  String missionSelected;

 MissionSelectionScreen(this.missionSelected);

  @override
  State<MissionSelectionScreen> createState() => _MissionSelectionScreenState();
}

class _MissionSelectionScreenState extends State<MissionSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/background_image.png'),
    fit: BoxFit.cover,
    ),
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Stack(
    children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowLeft),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 14),
            child: Text(
              "Select Mission",
              style: GoogleFonts.adventPro(fontSize: 40,fontWeight: FontWeight.w900, color: Colors.white),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Text(
              "Each mission has increased level of difficulty!!",
              style: GoogleFonts.adventPro(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Mission1Button('Mission 1', Colors.green,Colors.black, 500,100,widget.missionSelected),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Mission2Button('Mission 2', Colors.deepOrange,Colors.black, 500,100, widget.missionSelected),
          ),


        ],
      ),
        )
    );
  }
}
