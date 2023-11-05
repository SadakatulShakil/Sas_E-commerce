import 'package:flutter/material.dart';

class ColorResources {

  Color lightgreenshede = Color(0xFFF0FAF6);
  Color lightgreenshede1 = Color(0xFFB2D9CC);
  Color greenshede0 = Color(0xFF66A690);
  Color greenshede1 = Color(0xFF93C9B5);
  Color primarygreen = Color(0xFF1E3A34);
  Color grayshade = Color(0xFF93B3AA);
  Color colorAcent = Color(0xFF78C2A7);
  Color cyanColor = Color(0xFF6D7E6E);

  static const kAnimationDuration = Duration(milliseconds: 200);

  static const Map<int, Color> colorMap = {
    50: Color(0x101455AC),
    100: Color(0x201455AC),
    200: Color(0x301455AC),
    300: Color(0x401455AC),
    400: Color(0x501455AC),
    500: Color(0x601455AC),
    600: Color(0x701455AC),
    700: Color(0x801455AC),
    800: Color(0x901455AC),
    900: Color(0xff1455AC),
  };

  static const MaterialColor primaryMaterial = MaterialColor(0xFF1455AC, colorMap);
}