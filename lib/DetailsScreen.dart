import 'package:flutter/material.dart';
import 'package:musicplayer_prototype1/SongListScreen.dart';

class DetailsScreen extends StatelessWidget {
  final String itemName;

  const DetailsScreen({Key? key, required this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item ${index + 1} - $itemName'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongListScreen(itemName: itemName, selectedIndex: index),
            ),
          ),
        ),
      ),
    );
  }
}