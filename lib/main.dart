import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Api/api_service.dart';
import 'Screens/auth/auth_screen.dart';
import 'Screens/home/dashboard_screen.dart';
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

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sas-Ecommerce',
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: greenshede0,
              cursorColor: greenshede0, // Set the cursor color here
            ),
            primarySwatch: Colors.pink,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/auth': (context) => AuthScreen(),
            '/main': (context) => DashBoardScreen(),
          },
        );
      },
    );
  }
}
