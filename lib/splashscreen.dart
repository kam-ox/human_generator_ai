import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      title: Text(
        'Face Generator',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.white,
        ),
      ),
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(138, 35, 135, 1),
          Color.fromRGBO(255, 64, 87, 1),
          Color.fromRGBO(242, 113, 33, 1)
        ],
      ),
      loaderColor: Colors.white,
    );
  }
}
