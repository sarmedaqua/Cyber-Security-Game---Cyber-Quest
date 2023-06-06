import 'package:cybersecurity_game_cyberquest/game_main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'mission_screens/ethical_hacker_missions/mission2_ethicalhacker.dart';
import 'mission_screens/security_analyst_missions/mission1_secanalyst.dart';

class Ethfinalvid extends StatefulWidget {
  const Ethfinalvid({Key? key}) : super(key: key);

  @override
  State<Ethfinalvid> createState() => _EthfinalvidState();
}

class _EthfinalvidState extends State<Ethfinalvid> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.asset('assets/Ethical_Hacker_All_Missions_completed.mp4');
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
      setState(() {});
    });
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _toggleVideoPlayback() {
    if (_isVideoPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  void _restartVideo() {
    _videoPlayerController.seekTo(Duration.zero);
    _videoPlayerController.play();
    setState(() {
      _isVideoPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Video Player
          Container(
            height: 500, // Replace with your desired height
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _videoPlayerController.pause();
                  // Navigate to the Flutter screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: Text('Play Again'),
              ),


            ],
          ),
        ],
      ),
    );
  }
}