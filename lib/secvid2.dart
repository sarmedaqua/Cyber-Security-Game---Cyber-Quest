import 'package:cybersecurity_game_cyberquest/mission_screens/security_analyst_missions/mission2_secanalyst.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'mission_screens/security_analyst_missions/mission1_secanalyst.dart';

class Secvid2 extends StatefulWidget {
  const Secvid2({Key? key}) : super(key: key);

  @override
  State<Secvid2> createState() => _Secvid2State();
}

class _Secvid2State extends State<Secvid2> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.asset('assets/Security_Analyst_Mission_2.mp4');
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
                    MaterialPageRoute(builder: (context) => SecAnalystMission2()),
                  );
                },
                child: Text('Skip Video'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _toggleVideoPlayback,
                child: Text(_isVideoPlaying ? 'Pause Video' : 'Resume Video'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _restartVideo,
                child: Text('Restart Video'),
              ),

            ],
          ),
        ],
      ),
    );
  }
}