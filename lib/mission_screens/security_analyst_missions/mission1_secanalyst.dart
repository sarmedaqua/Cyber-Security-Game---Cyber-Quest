import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../game_main.dart';

class SecAnalystMission1 extends StatefulWidget {
  const SecAnalystMission1({Key? key}) : super(key: key);

  @override
  State<SecAnalystMission1> createState() => _SecAnalystMission1State();
}

class _SecAnalystMission1State extends State<SecAnalystMission1> {
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
      'question': 'What is a SQL injection attack?',
      'options': [
        'An attack that exploits vulnerabilities in a database query language',
        'An attack that targets social engineering',
        'An attack that floods a network with traffic'
      ],
      'answer': 'An attack that exploits vulnerabilities in a database query language'
    },
    {
      'question': 'What is a cross-site scripting (XSS) attack?',
      'options': [
        'An attack that manipulates user input and executes malicious scripts in a web application',
        'An attack that intercepts network traffic to gather sensitive information',
        'An attack that tricks users into revealing confidential information'
      ],
      'answer': 'An attack that manipulates user input and executes malicious scripts in a web application'
    },
    {
      'question': 'What is privilege escalation?',
      'options': [
        'An attack that bypasses access controls to gain higher privileges',
        'An attack that exploits vulnerabilities in network protocols',
        'An attack that floods a network with traffic'
      ],
      'answer': 'An attack that bypasses access controls to gain higher privileges'
    },
    {
      'question': 'What is a firewall?',
      'options': [
        'A software or hardware-based security system that monitors incoming and outgoing network traffic',
        'A type of malware that encrypts a user\'s files and demands a ransom for their release',
        'A form of attack that tricks users into revealing confidential information'
      ],
      'answer': 'A software or hardware-based security system that monitors incoming and outgoing network traffic'
    },
    {
      'question': 'What is encryption?',
      'options': [
        'The process of converting plaintext into ciphertext to protect sensitive information',
        'A software or hardware-based security system that monitors incoming and outgoing network traffic',
        'A type of malware that encrypts a user\'s files and demands a ransom for their release'
      ],
      'answer': 'The process of converting plaintext into ciphertext to protect sensitive information'
    },
    {
      'question': 'What is a DDoS attack?',
      'options': [
        'An attack that floods a network or server with a high volume of traffic to make it unavailable',
        'An attack that manipulates user input and executes malicious scripts in a web application',
        'An attack that targets social engineering'
      ],
      'answer': 'An attack that floods a network or server with a high volume of traffic to make it unavailable'
    },
    {
      'question': 'What is a vulnerability assessment?',
      'options': [
        'A systematic approach to identifying and evaluating security vulnerabilities in a system',
        'A software or hardware-based security system that monitors incoming and outgoing network traffic',
        'An attack that exploits vulnerabilities in network protocols'
      ],
      'answer': 'A systematic approach to identifying and evaluating security vulnerabilities in a system'
    },
    {
      'question': 'What is two-factor authentication?',
      'options': [
        'A security mechanism that requires users to provide two forms of identification to access a system',
        'A type of malware that encrypts a user\'s files and demands a ransom for their release',
        'An attack that manipulates user input and executes malicious scripts in a web application'
      ],
      'answer': 'A security mechanism that requires users to provide two forms of identification to access a system'
    },
    {
      'question': 'What is social engineering?',
      'options': [
        'A form of attack that tricks users into revealing confidential information',
        'An attack that manipulates user input and executes malicious scripts in a web application',
        'A security mechanism that requires users to provide two forms of identification to access a system'
      ],
      'answer': 'A form of attack that tricks users into revealing confidential information'
    },
    {
      'question': 'What is malware?',
      'options': [
        'Malicious software designed to disrupt, damage, or gain unauthorized access to a computer system',
        'A systematic approach to identifying and evaluating security vulnerabilities in a system',
        'An attack that targets social engineering'
      ],
      'answer': 'Malicious software designed to disrupt, damage, or gain unauthorized access to a computer system'
    },
    {
      'question': 'What is a phishing attack?',
      'options': [
        'An attack that tricks users into revealing confidential information',
        'An attack that floods a network or server with a high volume of traffic to make it unavailable',
        'An attack that exploits vulnerabilities in a database query language'
      ],
      'answer': 'An attack that tricks users into revealing confidential information'
    },
    {
      'question': 'What is network security?',
      'options': [
        'The practice of protecting a network and its data from unauthorized access or attacks',
        'A form of attack that tricks users into revealing confidential information',
        'A software or hardware-based security system that monitors incoming and outgoing network traffic'
      ],
      'answer': 'The practice of protecting a network and its data from unauthorized access or attacks'
    },
    {
      'question': 'What is a brute force attack?',
      'options': [
        'An attack that attempts to guess passwords or encryption keys by systematically trying all possible combinations',
        'A systematic approach to identifying and evaluating security vulnerabilities in a system',
        'An attack that exploits vulnerabilities in a database query language'
      ],
      'answer': 'An attack that attempts to guess passwords or encryption keys by systematically trying all possible combinations'
    },
    {
      'question': 'What is a vulnerability?',
      'options': [
        'A weakness or flaw in a system that can be exploited by an attacker',
        'A type of malware that encrypts a user\'s files and demands a ransom for their release',
        'An attack that floods a network or server with a high volume of traffic to make it unavailable'
      ],
      'answer': 'A weakness or flaw in a system that can be exploited by an attacker'
    },
    {
      'question': 'What is a security incident?',
      'options': [
        'An event or occurrence that indicates a possible breach of security policies or safeguards',
        'A form of attack that tricks users into revealing confidential information',
        'A systematic approach to identifying and evaluating security vulnerabilities in a system'
      ],
      'answer': 'An event or occurrence that indicates a possible breach of security policies or safeguards'
    },
    {
      'question': 'What is access control?',
      'options': [
        'The process of granting or denying specific permissions to authorized users',
        'A security mechanism that requires users to provide two forms of identification to access a system',
        'An attack that manipulates user input and executes malicious scripts in a web application'
      ],
      'answer': 'The process of granting or denying specific permissions to authorized users'
    },
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
    } else if (_score >= 10) {
      message = "Well done, Ethical Hacker! You did a good job!";
    } else {
      message = "Good effort, Ethical Hacker! Keep practicing!";
      playFailedMusic();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Completed'),
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
              "Welcome To Mission 1: The Breach!",
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



