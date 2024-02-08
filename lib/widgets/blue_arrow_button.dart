import 'package:flutter/material.dart';

class BlueArrowButton extends StatelessWidget {
  const BlueArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 49,
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: const Color.fromRGBO(24, 64, 134, 1),
              ),
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(38, 121, 228, 1)),
          child: Image.asset('assets/images/backArrow_icon.png'),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 49,
              height: 48,
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
