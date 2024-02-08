import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle headlineOutline = TextStyle(
    fontSize: 48,
    height: 1.1,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13
      ..color = const Color.fromRGBO(196, 199, 134, 1),
  );
  static const TextStyle headline = TextStyle(
    fontSize: 48,
    height: 1.1,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    color: Color.fromRGBO(202, 34, 44, 1),
  );
}
