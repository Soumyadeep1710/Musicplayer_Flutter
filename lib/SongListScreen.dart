import 'package:flutter/material.dart';
import 'package:musicplayer_prototype1/MusicPlayerScreen.dart';

class SongListScreen extends StatelessWidget {
  final String itemName;
  final int selectedIndex;

  const SongListScreen({Key? key, required this.itemName, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final songTitle = 'Song ${index + 1}';
          return ListTile(
            title: Text(songTitle),
            subtitle: Text('Item $itemName - List item $selectedIndex'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MusicPlayerScreen(songTitle: songTitle, imageUrl: 'https://picsum.photos/200/300',backgroundColor: Colors.blueGrey,),
              ),
            ),
          );
        },
      ),
    );
  }
}