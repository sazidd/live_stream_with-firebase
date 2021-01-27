import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TvShow extends StatefulWidget {
  final String title;
  final String url;

  TvShow({this.title, this.url});

  @override
  _TvShowState createState() => _TvShowState();
}

class _TvShowState extends State<TvShow> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(this.widget.url)
      ..addListener(() {
        if (_controller.value.initialized) {
          print(_controller.value.position);
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          this.widget.title,
          style: TextStyle(color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.orange[200]],
            ),
          ),
        ),
      ),
      body: Center(
          child: Stack(
        children: <Widget>[
          _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: 7 / 8,
                  // aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator()
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
