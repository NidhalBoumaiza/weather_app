import 'package:flutter/material.dart';

class Constants {
  static final Color primaryColor = const Color(0xff90B2F9);
  static final Color secondaryColor = const Color(0xff90B2F8);
  static final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff83B4E3), Color(0xff6DA4D6)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}