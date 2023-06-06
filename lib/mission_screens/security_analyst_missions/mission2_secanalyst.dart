import 'dart:math';

import 'package:cybersecurity_game_cyberquest/secfinalvid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../game_main.dart';

class SecAnalystMission2 extends StatefulWidget {
  const SecAnalystMission2({Key? key}) : super(key: key);

  @override
  State<SecAnalystMission2> createState() => _SecAnalystMission2State();
}

class _SecAnalystMission2State extends State<SecAnalystMission2> {

  final player = AudioPlayer();

  void playBackgroundMusic() async {
    await player.play(UrlSource('https://audio.jukehost.co.uk/79WHZvEEBVtB8EgiDeegrGm9fUavd8BU'));
  }

  void playFailedMusic() async {
    await player.play(UrlSource('https://audio.jukehost.co.uk/UTqzgWnA5875SGvWSxzlTFHkM05jnIub'));
  }

  @override
  void initState() {
    super.initState();
    playBackgroundMusic();
  }

  void dispose() {
    player.dispose();

    super.dispose();
  }




  final int _duration = 20;
  final CountDownController _controller = CountDownController();

  bool _isCountdownStarted = false;
  bool _isQuizFinished = false;
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _resultLabel = '';
  bool _quizCompleted = false; // Flag to track if the quiz was completed before timer stops

  List<Map<String, dynamic>> _questions = [
    {
      "question": "Which one is more secure: symmetric or asymmetric encryption?",
      "options": [
        "Symmetric encryption is more secure because it uses a longer key length.",
        "Asymmetric encryption is more secure because it uses a pair of keys.",
        "Both symmetric and asymmetric encryption are equally secure."
      ],
      "answer": "Asymmetric encryption is more secure because it uses a pair of keys."
    },
    {
      "question": "What is a zero-day vulnerability?",
      "options": [
        "A vulnerability that has been discovered but not yet patched.",
        "A vulnerability that allows attackers to gain unauthorized access to a system.",
        "A vulnerability that is unknown to software vendors and has no available patch."
      ],
      "answer": "A vulnerability that is unknown to software vendors and has no available patch."
    },
    {
      "question": "How can zero-day vulnerabilities impact cybersecurity?",
      "options": [
        "Zero-day vulnerabilities can be exploited by attackers to launch targeted attacks and gain unauthorized access to systems.",
        "Zero-day vulnerabilities have no impact on cybersecurity as they are unknown to software vendors.",
        "Zero-day vulnerabilities only affect outdated software versions."
      ],
      "answer": "Zero-day vulnerabilities can be exploited by attackers to launch targeted attacks and gain unauthorized access to systems."
    },
    {
      "question": "What is a buffer overflow attack?",
      "options": [
        "An attack that overwhelms a system's memory by inputting more data than it can handle, leading to a crash or execution of malicious code.",
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that manipulates user input and executes malicious scripts in a web application."
      ],
      "answer": "An attack that overwhelms a system's memory by inputting more data than it can handle, leading to a crash or execution of malicious code."
    },
    {
      "question": "How can buffer overflow attacks be prevented or mitigated?",
      "options": [
        "By encrypting sensitive data to protect it from unauthorized access.",
        "By using input validation and proper bounds checking to ensure data input does not exceed allocated memory.",
        "By using strong passwords and two-factor authentication."
      ],
      "answer": "By using input validation and proper bounds checking to ensure data input does not exceed allocated memory."
    },
    {
      "question": "What is a penetration test?",
      "options": [
        "A test to measure the performance and scalability of a system under high load conditions.",
        "A test to check the compatibility of software across different platforms.",
        "A test to identify vulnerabilities and assess the security of a system by simulating real-world attacks."
      ],
      "answer": "A test to identify vulnerabilities and assess the security of a system by simulating real-world attacks."
    },
    {
      "question": "Why is conducting a penetration test important?",
      "options": [
        "To ensure compliance with industry regulations and standards.",
        "To identify vulnerabilities and weaknesses in a system before they are exploited by attackers.",
        "To measure the performance and scalability of a system under high load conditions."
      ],
      "answer": "To identify vulnerabilities and weaknesses in a system before they are exploited by attackers."
    },
    {
      "question": "What is a man-in-the-middle (MITM) attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that overwhelms a system's memory by inputting more data than it can handle.",
        "An attack that manipulates user input and executes malicious scripts in a web application."
      ],
      "answer": "An attack that intercepts network traffic to gather sensitive information."
    },
    {
      "question": "How can MITM attacks be prevented or detected?",
      "options": [
        "By using strong encryption, such as HTTPS, to secure communication channels.",
        "By implementing strict firewall rules to block unauthorized network traffic.",
        "By validating user input and implementing proper error handling in web applications."
      ],
      "answer": "By using strong encryption, such as HTTPS, to secure communication channels."
    },
    // Add more questions here...
  ];



  void _selectAnswer(String selectedAnswer) {
    if (!_isCountdownStarted) {
      return;
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final correctAnswer = currentQuestion['answer'];

    if (selectedAnswer == correctAnswer) {
      setState(() {
        _score += 5;
        _resultLabel = 'CORRECT!';
      });
    } else {
      setState(() {
        _resultLabel = 'NOT CORRECT';
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _resultLabel = '';
      });
    } else {
      setState(() {
        _isQuizFinished = true;
        _quizCompleted = true; // Set the flag when the quiz is completed
        _showFinalScoreDialog(); // Show the final score dialog
      });
    }
  }

  void _showFinalScoreDialog() {
    String message;

    if (_score >= 15) {
      message = "Great job, Ethical Hacker! You did an excellent job!";
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('All Mission Completed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              SizedBox(height: 20),
              Text('Final Score: $_score'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Secfinalvid()));
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else if (_score >= 10) {
      message = "Well done, Ethical Hacker! You did a good job!";
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('All Mission Completed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              SizedBox(height: 20),
              Text('Final Score: $_score'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Secfinalvid()));
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      message = "Try Again, Ethical Hacker! Keep practicing!";
      playFailedMusic();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz Not Completed'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              SizedBox(height: 20),
              Text('Final Score: $_score'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => MainScreen()));
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 14),
            child: Text(
              "Welcome To Mission 2: The Intrusion!",
              style: GoogleFonts.adventPro(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '$_score',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.3,
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: GestureDetector(
                        onTap: () {
                          if (!_isCountdownStarted) {
                            _controller.start();
                          }
                        },
                        child: CircularCountDownTimer(
                          duration: _duration,
                          initialDuration: 0,
                          controller: _controller,
                          ringColor: Colors.grey[300]!,
                          fillColor: Colors.purpleAccent[100]!,
                          backgroundColor: Colors.purple[500],
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.round,
                          textStyle: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            debugPrint('Countdown Started');
                            setState(() {
                              _isCountdownStarted = true;
                            });
                          },
                          onComplete: () {
                            debugPrint('Countdown Ended');
                            if (!_quizCompleted) {
                              _showFinalScoreDialog();
                            }
                          },
                          onChange: (String timeStamp) {
                            debugPrint('Countdown Changed $timeStamp');
                          },
                          timeFormatterFunction: (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return "Start";
                            } else {
                              return Function.apply(defaultFormatterFunction, [duration]);
                            }
                          },
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _resultLabel,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      _questions[_currentQuestionIndex]['question'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        for (String option in _shuffleOptions(_questions[_currentQuestionIndex]['options']))
                          SizedBox(
                            width: 400,
                            child: ElevatedButton(
                              onPressed: _isCountdownStarted ? () => _selectAnswer(option) : null,
                              child: Text(option),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final _random = Random();
  List<String> _shuffleOptions(List<String> options) {
    // Create a copy of the original options list
    List<String> shuffledOptions = List<String>.from(options);

    // Shuffle the options using the Fisher-Yates algorithm
    for (int i = shuffledOptions.length - 1; i > 0; i--) {
      int j = _random.nextInt(i + 1);
      String temp = shuffledOptions[i];
      shuffledOptions[i] = shuffledOptions[j];
      shuffledOptions[j] = temp;
    }

    return shuffledOptions;
  }
}
