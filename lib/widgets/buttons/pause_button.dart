import 'package:flutter/cupertino.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 49,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 4,
                color: const Color.fromRGBO(24, 64, 134, 1),
              ),
              color: const Color.fromRGBO(38, 121, 228, 1)),
          child: Image.asset('assets/images/pause_icon.png'),
        ),
      ],
    );
  }
}
