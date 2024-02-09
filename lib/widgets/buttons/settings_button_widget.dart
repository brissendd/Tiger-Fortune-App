import 'package:flutter/material.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
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
            child: Image.asset('assets/images/settings_icon.png'),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
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
