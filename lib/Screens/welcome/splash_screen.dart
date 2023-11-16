import 'package:flutter/material.dart';
import 'package:sas_ecommerce/helper/constant.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../auth/auth_screen.dart';
import '../home/dashboard_screen.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgreenshede,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
    //   FutureBuilder<bool>(
    //   future: checkFirstTime(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       bool isFirstTime = snapshot.data ?? true;
    //
    //       // Decide which screen to show based on whether it's the first time
    //       return isFirstTime ? OnboardScreen() : AuthScreen();
    //     } else {
    //       return CircularProgressIndicator();
    //     }
    //   },
    // );
  }

  Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_time') ?? true;
  }
}
