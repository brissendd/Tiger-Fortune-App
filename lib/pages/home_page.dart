import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_style.dart';
import 'package:tiger_fortune_app/widgets/settings_button_widget.dart';
import 'package:tiger_fortune_app/widgets/sound_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/mainScreenBackground.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 70,
            left: 34,
            child: SizedBox(
              width: 330,
              height: 349,
              child: Image.asset('assets/images/tigerMainScreen.png'),
            ),
          ),
          Positioned(
            top: 43,
            left: 326,
            height: 96,
            width: 192,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Stack(
                children: [
                  Text('TIGER\nFORTUNE',
                      maxLines: 2, style: AppStyle.headline1Outline),
                  const Text('TIGER\nFORTUNE',
                      maxLines: 2, style: AppStyle.headline1),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 310,
            left: 62,
            child: Row(
              children: [
                SoundButton(),
                SizedBox(width: 8),
                SettingsButton()
              ],
            ),
          ),
          const Column()
        ],
      ),
    );
  }
}
