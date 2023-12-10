import 'package:flutter/material.dart';
import 'package:sas_ecommerce/helper/constant.dart';
import 'package:sas_ecommerce/utill/stored_images.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../utill/dimensions.dart';
import '../home/dashboard_screen.dart';

class CheckOutSuccessScreen extends StatefulWidget {
  @override
  _CheckOutSuccessScreenState createState() => _CheckOutSuccessScreenState();
}

class _CheckOutSuccessScreenState extends State<CheckOutSuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/success.png'),

            SizedBox(height: 50,),

            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const DashBoardScreen()),
                        (route) => false);
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                    vertical: Dimensions.paddingSizeDefault),
                decoration: BoxDecoration(
                  color: accentShade,
                ),
                child: Center(
                    child: Text('Back to Home Page',
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeExtraLarge,
                          color: Colors.white,
                        ))),
              ),
            )
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
