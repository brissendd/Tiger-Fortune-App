import 'package:flutter/material.dart';

abstract class AppStyle {
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
      letterSpacing: 1);
  static const TextStyle dailyRewardWhite = TextStyle(
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color.fromRGBO(252, 252, 252, 1),
  );
  static const TextStyle dailyRewardBlue = TextStyle(
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color.fromRGBO(38, 121, 228, 1),
  );
  static const TextStyle dailyRewardRed = TextStyle(
    fontFamily: 'SFProText',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color.fromRGBO(238, 33, 33, 1),
  );
}
