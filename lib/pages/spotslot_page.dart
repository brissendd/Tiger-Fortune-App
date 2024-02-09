import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/widgets/buttons/pause_button.dart';

class SpotSlotPage extends StatelessWidget {
  const SpotSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/spotSlotPage/spotSlotBackground.png'),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 25,
          left: 776,
          child: PauseButton(),
        )
      ]),
    );
  }
}
