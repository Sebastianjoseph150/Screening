import 'dart:async';
import 'package:flutter/material.dart';
import 'package:screenig/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Homscreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
