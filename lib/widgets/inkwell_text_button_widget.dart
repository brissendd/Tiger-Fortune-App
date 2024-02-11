import 'package:flutter/material.dart';

class InkwellTextButtonWidget extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final String text;
  final double width;
  final double height;
  final void Function()? onTap;
  final TextStyle textStyle;

  const InkwellTextButtonWidget({
    super.key,
    required this.color,
    required this.borderColor,
    required this.text,
    required this.width,
    required this.height,
    required this.onTap,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
