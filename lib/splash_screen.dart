import 'package:flutter/material.dart';
import 'package:musicplayer_prototype1/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Navigate to home screen after a delay
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Design your splash screen here
      body: Center(
        child: Text('App Name', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}