import 'package:cybersecurity_game_cyberquest/components/ButtonWidget.dart';
import 'package:cybersecurity_game_cyberquest/mission_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          //assets/background_image.png
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
    SafeArea(
    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 14),
                  child: Text(
                    "Welcome To CyberQuest Game",
                    style: GoogleFonts.adventPro(fontSize: 50, color: Colors.white),

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60,),

          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Text(
              "Select your role",
              style: GoogleFonts.adventPro(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget('Security Analyst', Colors.blueGrey,Colors.black, 500,100),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget('Ethical Hacker', Colors.grey,Colors.black, 500,100),
          ),

        ],
      ),


    )
    );
  }
}
