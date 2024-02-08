import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_style.dart';
import 'package:tiger_fortune_app/widgets/blue_arrow_button.dart';
import 'package:tiger_fortune_app/widgets/cupertino_switch.dart';
import 'package:tiger_fortune_app/widgets/logo_choosing.dart';
import 'package:tiger_fortune_app/widgets/settings_buttons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(81, 31, 31, 1),
      body: Stack(
        children: [
          Positioned(
            width: 131,
            height: 32,
            top: 32,
            left: 356,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Stack(
                children: [
                  Text(
                    'SETTINGS',
                    style: AppStyle.headline2Outline,
                  ),
                  const Text(
                    'SETTINGS',
                    style: AppStyle.headline2,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 32,
            left: 62,
            child: BlueArrowButton(),
          ),
          const Positioned(
            top: 154,
            left: 153,
            child: SettingsPageButtons(),
          ),
          const Positioned(
            top: 154,
            left: 426,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Vibro',
                      style: AppStyle.buttonName,
                    ),
                    SizedBox(width: 114),
                    CustomCupertinoSwitch(),
                  ],
                ),
                Text(
                  'App icon',
                  style: AppStyle.buttonName,
                ),
                LogoChoosing(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
