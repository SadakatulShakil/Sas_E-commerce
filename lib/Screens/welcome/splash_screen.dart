import 'package:byte_trek_task/Screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../home/main_screen.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, '/main');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkFirstTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bool isFirstTime = snapshot.data ?? true;

          // Decide which screen to show based on whether it's the first time
          return isFirstTime ? OnboardScreen() : AuthScreen();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_time') ?? true;
  }
}
