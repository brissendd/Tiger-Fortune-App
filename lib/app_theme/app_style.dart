import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle headline1Outline = TextStyle(
    fontSize: 48,
    height: 0.9,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = const Color.fromRGBO(196, 199, 134, 1),
  );
  static const TextStyle headline1 = TextStyle(
    fontSize: 48,
    height: 0.9,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    color: Color.fromRGBO(202, 34, 44, 1),
  );
  static TextStyle headline2Outline = TextStyle(
    fontSize: 32,
    height: 0.9,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = const Color.fromRGBO(196, 199, 134, 1),
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 32,
    height: 0.9,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    color: Color.fromRGBO(238, 33, 33, 1),
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Color.fromRGBO(252, 252, 252, 1),
  );
  static const TextStyle thickText = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Color.fromRGBO(252, 252, 252, 1),
    letterSpacing: 1
  );
  static const TextStyle dailyRewardWhite = TextStyle(
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color.fromRGBO(252, 252, 252, 1),
  );
  static const TextStyle dailyRewardBlue = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color.fromRGBO(38, 121, 228, 1),
  );
  static const TextStyle dailyRewardRed  = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color.fromRGBO(238, 33, 33, 1),
  );
}