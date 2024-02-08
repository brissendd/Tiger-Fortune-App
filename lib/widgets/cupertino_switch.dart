import 'package:flutter/cupertino.dart';

class CustomCupertinoSwitch extends StatefulWidget {
  const CustomCupertinoSwitch({super.key});

  @override
  State<CustomCupertinoSwitch> createState() => _CustomCupertinoSwitchState();
}

class _CustomCupertinoSwitchState extends State<CustomCupertinoSwitch> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
      activeColor: const Color.fromRGBO(238, 33, 33, 1),
      trackColor: CupertinoColors.inactiveGray,
    );
  }
}
