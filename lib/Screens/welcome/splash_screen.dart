import 'package:flutter/material.dart';
import 'package:sas_ecommerce/helper/constant.dart';
import 'package:sas_ecommerce/utill/stored_images.dart';
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
      backgroundColor: primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.logoImage, height: 200,width: 200,),
            Image.asset(Images.logoText, width: MediaQuery.of(context).size.width-100,),
          ],
        ),
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
