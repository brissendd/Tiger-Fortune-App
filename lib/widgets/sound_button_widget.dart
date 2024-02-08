import 'package:flutter/material.dart';

class SoundButton extends StatefulWidget {
  const SoundButton({super.key});

  @override
  State<SoundButton> createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  bool soundOn = true;
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
                color: const Color.fromRGBO(190, 23, 23, 1),
              ),
              color: const Color.fromRGBO(238, 33, 33, 1),
            ),
            child: soundOn
                ? Image.asset('assets/images/volume_icon.png')
                : Image.asset('assets/images/volumeOff_icon.png')),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (soundOn) {
                setState(() {
                  soundOn = false;
                });
              } else {
                setState(() {
                  soundOn = true;
                });
              }
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
