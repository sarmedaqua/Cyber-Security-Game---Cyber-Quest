import 'package:cybersecurity_game_cyberquest/game_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class EthicalHackerMission1 extends StatefulWidget {
  const EthicalHackerMission1({Key? key}) : super(key: key);

  @override
  State<EthicalHackerMission1> createState() => _EthicalHackerMission1State();
}

class _EthicalHackerMission1State extends State<EthicalHackerMission1> {
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
  bool mission1Completed = false;
  bool mission2Completed = false;
  bool mission3Completed = false;
  int mission1Score = 0;
  int mission2Score = 0;
  int mission3Score = 0;

  bool _isCountdownStarted = false;
  bool _isQuizFinished = false;
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _resultLabel = '';
  bool _quizCompleted = false; // Flag to track if the quiz was completed before timer stops

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the first step you should take to mitigate the breach?',
      'options': [
        'Disconnect the affected servers from the network',
        'Notify the management and other stakeholders',
        'Analyze the hackers actions to gather evidence',
        'Conduct a vulnerability assessment of the companys systems'
      ],
      'answer': 'Disconnect the affected servers from the network'
    },
    {
      'question': 'After disconnecting the affected servers, what should you do next to further contain the breach?',
      'options': [
        'Change all user passwords immediately',
        'Conduct a thorough forensic investigation',
        'Restore affected servers from clean backups',
        'Patch the identified vulnerabilities in the systems'
      ],
      'answer': 'Restore affected servers from clean backups'
    },
    {
      'question': 'What is an essential step to prevent future breaches?',
      'options': [
        'Implement multi-factor authentication',
        'Update antivirus software on all systems',
        'Conduct regular security awareness training',
        'Monitor network traffic in real-time'
      ],
      'answer': 'Implement multi-factor authentication'
    },
    {
      'question': 'What can be done to strengthen the companys incident response capabilities?',
    'options': [
      'Create a detailed incident response plan',
      'Purchase additional security hardware',
      'Hire more security analysts',
      'Conduct regular penetration testing'
    ],
      'answer': 'Create a detailed incident response plan'
    },
    {
      'question': 'What measures can be taken to secure remote access to the companys systems?',
    'options': [
      'Use a virtual private network (VPN) for remote connections',
      'Restrict access to specific IP addresses',
      'Implement strong encryption for remote sessions',
      'Enforce regular password changes for remote users'
    ],
      'answer': 'Use a virtual private network (VPN) for remote connections'
    },
    {
      'question': 'How can you ensure the physical security of the companys data centers?',
    'options': [
      'Implement access control systems and surveillance cameras',
      'Conduct regular vulnerability scans on physical infrastructure',
      'Restrict access to authorized personnel only',
      'Install fire suppression systems in data center facilities'
    ],
      'answer': 'Implement access control systems and surveillance cameras'
    }
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
              "Welcome To Mission 1: The Reconnaissance!",
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