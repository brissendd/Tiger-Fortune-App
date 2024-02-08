import 'package:flutter/material.dart';

class SettingsBUtton extends StatefulWidget {
  const SettingsBUtton({super.key});

  @override
  State<SettingsBUtton> createState() => _SettingsBUttonState();
}

class _SettingsBUttonState extends State<SettingsBUtton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 4,
          color: Color.fromRGBO(190, 23, 23, 1),
        ),
        color: Color.fromRGBO(238, 33, 33, 1),
      ),
      child: Image.asset(
        'assets/images/settings_icon.png',
      ),
    );
  }
}