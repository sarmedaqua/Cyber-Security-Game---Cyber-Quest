import 'dart:math';

import 'package:cybersecurity_game_cyberquest/ethfinalvid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../game_main.dart';

class EthicalHackerMission2 extends StatefulWidget {
  const EthicalHackerMission2({Key? key}) : super(key: key);

  @override
  State<EthicalHackerMission2> createState() => _EthicalHackerMission2State();
}

class _EthicalHackerMission2State extends State<EthicalHackerMission2> {
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
      'question': 'What is session hijacking?',
      'options': [
        'Gaining unauthorized access to a user\'s session',
        'Exploiting vulnerabilities in a web application database',
        'Disrupting network traffic'
      ],
      'answer': 'Gaining unauthorized access to a user\'s session'
    },
    {
      'question': 'What is the purpose of a buffer overflow attack?',
      'options': [
        'Exploiting a programming error to overwrite a system\'s memory',
        'Intercepting and modifying network traffic',
        'Tricking users into revealing confidential information'
      ],
      'answer': 'Exploiting a programming error to overwrite a system\'s memory'
    },
    {
      'question': 'What is the concept of rootkit in ethical hacking?',
      'options': [
        'A set of tools and techniques used to gain and maintain unauthorized access to a system',
        'Manipulating human psychology to trick individuals into revealing confidential information',
        'Creating backups of important system files'
      ],
      'answer': 'A set of tools and techniques used to gain and maintain unauthorized access to a system'
    },
    {
      'question': 'What is the purpose of a honeypot in network security?',
      'options': [
        'A decoy system designed to attract and monitor attackers',
        'Encrypting sensitive data to protect it from unauthorized access',
        'Creating clones of a system to distribute network traffic'
      ],
      'answer': 'A decoy system designed to attract and monitor attackers'
    },
    {
      'question': 'What is the concept of man-in-the-middle (MITM) attack?',
      'options': [
        'Intercepting and altering communication between two parties without their knowledge',
        'Exploiting vulnerabilities in network protocols',
        'Overloading a system with excessive traffic'
      ],
      'answer': 'Intercepting and altering communication between two parties without their knowledge'
    },
    {
      'question': 'What is the purpose of a VPN in network security?',
      'options': [
        'Creating a secure and encrypted connection over a public network',
        'Monitoring and controlling incoming and outgoing network traffic',
        'Disrupting network traffic to make it unavailable'
      ],
      'answer': 'Creating a secure and encrypted connection over a public network'
    },
    {
      'question': 'What is the concept of DNS poisoning?',
      'options': [
        'Manipulating DNS resolution to redirect users to malicious websites',
        'Gaining higher levels of access and privileges than initially authorized',
        'Exploiting vulnerabilities in a web application database'
      ],
      'answer': 'Manipulating DNS resolution to redirect users to malicious websites'
    },
    {
      'question': 'What is the purpose of a proxy server in ethical hacking?',
      'options': [
        'Acting as an intermediary between a client and a server to enhance privacy and security',
        'Protecting sensitive information by converting it into unreadable form',
        'Exploiting vulnerabilities in a database query language'
      ],
      'answer': 'Acting as an intermediary between a client and a server to enhance privacy and security'
    },
    {
      'question': 'What is the concept of wireless hacking in ethical hacking?',
      'options': [
        'Gaining unauthorized access to wireless networks',
        'Tricking users into revealing confidential information',
        'Intercepting and modifying network traffic'
      ],
      'answer': 'Gaining unauthorized access to wireless networks'
    },
    {
      'question': 'What is the purpose of a firewall in network security?',
      'options': [
        'A software or hardware-based security system that monitors incoming and outgoing network traffic',
        'Encrypting sensitive data to protect it from unauthorized access',
        'Creating backups of important system files'
      ],
      'answer': 'A software or hardware-based security system that monitors incoming and outgoing network traffic'
    },
    {
      'question': 'What is the concept of social engineering in ethical hacking?',
      'options': [
        'Manipulating human psychology to trick individuals into revealing confidential information',
        'Exploiting vulnerabilities in network protocols',
        'Overloading a system with excessive traffic'
      ],
      'answer': 'Manipulating human psychology to trick individuals into revealing confidential information'
    },
    {
      'question': 'What is the purpose of vulnerability scanning in ethical hacking?',
      'options': [
        'Identifying and assessing security vulnerabilities in a system or network',
        'Intercepting and altering communication between two parties without their knowledge',
        'Creating clones of a system to distribute network traffic'
      ],
      'answer': 'Identifying and assessing security vulnerabilities in a system or network'
    },
    {
      'question': 'What is the concept of reverse engineering in ethical hacking?',
      'options': [
        'Analyzing and understanding the inner workings of a system or software',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Tricking users into revealing confidential information'
      ],
      'answer': 'Analyzing and understanding the inner workings of a system or software'
    },
    {
      'question': 'What is the purpose of a password cracking tool in ethical hacking?',
      'options': [
        'Attempting to guess passwords by systematically trying all possible combinations',
        'Encrypting sensitive data to protect it from unauthorized access',
        'Monitoring and controlling incoming and outgoing network traffic'
      ],
      'answer': 'Attempting to guess passwords by systematically trying all possible combinations'
    },
    {
      'question': 'What is the concept of privilege escalation in ethical hacking?',
      'options': [
        'Gaining higher levels of access and privileges than initially authorized',
        'Exploiting vulnerabilities in a web application database',
        'Overloading a system with excessive traffic'
      ],
      'answer': 'Gaining higher levels of access and privileges than initially authorized'
    },
    {
      'question': 'What is the purpose of a vulnerability exploit in ethical hacking?',
      'options': [
        'Taking advantage of security vulnerabilities to gain unauthorized access or control',
        'Manipulating human psychology to trick individuals into revealing confidential information',
        'Exploiting a programming error to overwrite a system\'s memory'
      ],
      'answer': 'Taking advantage of security vulnerabilities to gain unauthorized access or control'
    },
    {
      'question': 'What is the concept of SQL injection in ethical hacking?',
      'options': [
        'Exploiting vulnerabilities in a database query language to manipulate database content',
        'Intercepting and modifying network traffic',
        'Tricking users into revealing confidential information'
      ],
      'answer': 'Exploiting vulnerabilities in a database query language to manipulate database content'
    },
    {
      'question': 'What is the purpose of a denial-of-service (DoS) attack in ethical hacking?',
      'options': [
        'Disrupting the normal functioning of a system or network',
        'Gaining unauthorized access to a user\'s session',
        'Creating backups of important system files'
      ],
      'answer': 'Disrupting the normal functioning of a system or network'
    },
    {
      'question': 'What is the concept of cryptography in ethical hacking?',
      'options': [
        'Protecting sensitive information by converting it into unreadable form',
        'Exploiting vulnerabilities in network protocols',
        'Overloading a system with excessive traffic'
      ],
      'answer': 'Protecting sensitive information by converting it into unreadable form'
    },
    {
      'question': 'What is the purpose of a phishing campaign in ethical hacking?',
      'options': [
        'Tricking users into revealing confidential information',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Creating clones of a system to distribute network traffic'
      ],
      'answer': 'Tricking users into revealing confidential information'
    },
    {
      'question': 'What is the concept of malware analysis in ethical hacking?',
      'options': [
        'Analyzing and understanding the behavior and characteristics of malicious software',
        'Exploiting vulnerabilities in a web application database',
        'Intercepting and altering communication between two parties without their knowledge'
      ],
      'answer': 'Analyzing and understanding the behavior and characteristics of malicious software'
    },
    {
      'question': 'What is the purpose of a port scanner in ethical hacking?',
      'options': [
        'Identifying open ports and services on a network',
        'Manipulating human psychology to trick individuals into revealing confidential information',
        'Creating backups of important system files'
      ],
      'answer': 'Identifying open ports and services on a network'
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
                    CupertinoPageRoute(builder: (context) => Ethfinalvid()));
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
                    CupertinoPageRoute(builder: (context) => Ethfinalvid()));
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      message = "Not Enough, Ethical Hacker! Keep practicing!";
      playFailedMusic();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz not Completed'),
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
              child: Text('Try Again'),
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
              "Welcome To Mission 2: The Vulnerability Assessment!",
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