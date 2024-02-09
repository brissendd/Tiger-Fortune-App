import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_style.dart';
import 'package:tiger_fortune_app/widgets/buttons/settings_button_widget.dart';
import 'package:tiger_fortune_app/widgets/buttons/sound_button_widget.dart';

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
              children: [SoundButton(), SizedBox(width: 8), SettingsButton()],
            ),
          ),
          Positioned(
            top: 238,
            left: 298,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 241,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 4,
                          color: const Color.fromRGBO(190, 23, 23, 1),
                        ),
                        color: const Color.fromRGBO(238, 33, 33, 1),
                      ),
                      child: const Center(
                        child:
                            Text('Spots', style: AppStyle.redButton),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.of(context).pushNamed('/spots');
                        },
                        child: Container(
                          width: 241,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      width: 241,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 4,
                          color: const Color.fromRGBO(190, 23, 23, 1),
                        ),
                        color: const Color.fromRGBO(238, 33, 33, 1),
                      ),
                      child: const Center(
                        child:
                            Text('Exit', style: AppStyle.redButton),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Container(
                          width: 241,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
