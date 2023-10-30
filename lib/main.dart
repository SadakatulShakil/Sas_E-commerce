import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Api/api_service.dart';
import 'Screens/auth/auth_screen.dart';
import 'Screens/home/main_screen.dart';
import 'Screens/welcome/splash_screen.dart';
import 'helper/constant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ByteTrek Task',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: greenshede0,
          cursorColor: greenshede0, // Set the cursor color here
        ),
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/main': (context) => HomePage(),
      },
    );
  }
}
