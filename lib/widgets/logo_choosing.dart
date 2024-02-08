import 'package:flutter/material.dart';

class LogoChoosing extends StatefulWidget {
  const LogoChoosing({super.key});

  @override
  State<LogoChoosing> createState() => _LogoChoosingState();
}

class _LogoChoosingState extends State<LogoChoosing> {
  final List<Widget> logoList = [
    Image.asset('assets/images/appLogo1.png'),
    Image.asset('assets/images/appLogo2.png'),
    Image.asset('assets/images/appLogo3.png'),
    Image.asset('assets/images/appLogo4.png'),
    Image.asset('assets/images/appLogo5.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264,
      height: 136,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
          crossAxisSpacing: 0.1,
          mainAxisSpacing: 16
        ),
        itemCount: logoList.length,
        itemBuilder: (context, index) {
          return logoList[index];
        },
      ),
    );
  }
}
