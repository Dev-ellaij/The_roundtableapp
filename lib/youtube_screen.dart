import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeScreen extends StatefulWidget {
  final String videoId;

  const YouTubeScreen({super.key, required this.videoId});

  @override
  // ignore: library_private_types_in_public_api
  _YouTubeScreenState createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'The Roundtable Community',
          style: TextStyle(
            fontFamily: 'NeueMachina',
            fontSize: 20.sp,
            fontWeight: FontWeight.w100,
          ),
        ),
        centerTitle: true, // Centralizes the title
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              Expanded(
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    // ignore: avoid_print
                    print('Player is ready.');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
