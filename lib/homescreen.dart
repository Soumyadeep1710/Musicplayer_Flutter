import 'package:flutter/material.dart';
import 'package:musicplayer_prototype1/DetailsScreen.dart';
import 'package:musicplayer_prototype1/filepicker.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('चाकू से गोदा, फिर घसीटा... दिल्ली में डबल मर्डर का दिल दहलाने वाला वीडियो आया सामने'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 5; i++)
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(itemName: 'Item ${i + 1}'),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Center(child: Text('Item ${i + 1}')),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(itemName: 'Item ${i + 6}'),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Center(child: Text('Item ${i + 6}')),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text('App Name', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text('Upload'),
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PickAudioScreen())),
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
// onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen())),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add New Categories'),
//  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen())),
          ),
        ],
      ),
    );
  }
}