import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E0253),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Image.asset(
              'assets/images/logo.PNG',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  void getUser() async {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, '/sign_in', (route) => false));
  }
}
