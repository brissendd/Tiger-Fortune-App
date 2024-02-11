import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';

class OutlinedTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const OutlinedTextWidget(
      {super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = AppColor.textOutline,
          ),
        ),
        Text(
          text.toUpperCase(),
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
            color: AppColor.titlered,
          ),
        ),
      ],
    );
  }
}
