import 'package:flutter/material.dart';

class InkwellButtonWidget extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final double width;
  final double height;
  final void Function()? onTap;
  final String assetPath;

  const InkwellButtonWidget(
      {super.key,
      required this.color,
      required this.borderColor,
      required this.width,
      required this.height,
      required this.onTap,
      required this.assetPath});

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
          child: Image.asset(assetPath),
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
