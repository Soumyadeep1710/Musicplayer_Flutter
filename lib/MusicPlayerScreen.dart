import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String songTitle;
  final String imageUrl;
  final Color backgroundColor; // Added for background color

  const MusicPlayerScreen({Key? key, required this.songTitle, required this.imageUrl, required this.backgroundColor}) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final _player = AudioPlayer();
  double _currentSliderValue = 0.0;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        backgroundColor: widget.backgroundColor, // Set background color for app bar
      ),
      body: SingleChildScrollView(
        child: Container( // Wrap content with Container for styling
          color: widget.backgroundColor, // Set background color for entire screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.network(widget.imageUrl),
              SizedBox(height: 20.0),

              // Song Title with Text style
              Text(
                'Now Playing: ${widget.songTitle}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white, // Set text color
                ),
              ),

              // Playback State
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data!;
                    if (state.playing) {
                      return Text(
                        'Playing',
                        style: TextStyle(
                          color: Colors.green, // Set color for playing state
                        ),
                      );
                    } else {
                      return Text(
                        'Paused',
                        style: TextStyle(
                          color: Colors.orange, // Set color for paused state
                        ),
                      );
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),

              // Slider for seeking
              Slider(
                value: _currentSliderValue,
                min: 0.0,
                max: _player.duration?.inSeconds?.toDouble() ?? 0.0,
                activeColor: Colors.lightBlue, // Set active color for slider
                inactiveColor: Colors.grey, // Set inactive color for slider
                onChanged: (value) {
                  setState(() {
                    _currentSliderValue = value;
                    _player.seek(Duration(seconds: value.toInt()));
                  });
                },
              ),

              // Row for buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (_player.playing) {
                        _player.pause();
                      } else {
                        // _player.setAudioSource(AudioSource.uri("assets\songs\Abrars Entry Jamal Kudu - Animal 320 Kbps.mp3"));
                        _player.setAsset("assets\songs\Abrars Entry Jamal Kudu - Animal 320 Kbps.mp3");
                        _player.play();
                      }
                    },
                    icon: Icon(
                      _player.playing ? Icons.pause : Icons.play_arrow,
                      color: Colors.white, // Set icon color
                    ),
                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    onPressed: () {
                      // Implement logic to play previous song
                    },
                    icon: Icon(Icons.skip_previous, color: Colors.white), // Set icon color
                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    onPressed: () {
                      // Implement logic to play next song
                    },
                    icon: Icon(Icons.skip_next, color: Colors.white), // Set icon color
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
