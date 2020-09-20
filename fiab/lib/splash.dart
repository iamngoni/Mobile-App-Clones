import 'dart:async';
import 'dart:ui';

import 'package:fiab/base.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Timer(Duration(seconds: 5), () {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FiabBase(),
        ),
      );
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getHeight(context),
          width: getWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/harare.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 1,
              sigmaY: 1,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
        ),
        Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
