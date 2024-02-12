import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';
import 'package:tiger_fortune_app/widgets/logo_choosing.dart';

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
          Positioned(
            top: 32,
            left: 62,
            child: InkwellButtonWidget(
                color: AppColor.blue,
                borderColor: AppColor.darkBlue,
                width: 48,
                height: 49,
                onTap: () {
                  Navigator.of(context).pop();
                },
                assetPath: 'assets/images/backArrow_icon.png'),
          ),
          Positioned(
            top: 154,
            left: 153,
            child: Column(
              children: [
                InkwellTextButtonWidget(
                    color: AppColor.red,
                    borderColor: AppColor.darkRed,
                    text: 'Share with friends',
                    width: 241,
                    height: 49,
                    onTap: () {},
                    textStyle: AppStyle.buttonText),
                const SizedBox(height: 8),
                InkwellTextButtonWidget(
                    color: AppColor.red,
                    borderColor: AppColor.darkRed,
                    text: 'Privacy Policy',
                    width: 241,
                    height: 49,
                    onTap: () {},
                    textStyle: AppStyle.buttonText),
                const SizedBox(height: 8),
                InkwellTextButtonWidget(
                    color: AppColor.red,
                    borderColor: AppColor.darkRed,
                    text: 'Terms of use',
                    width: 241,
                    height: 49,
                    onTap: () {},
                    textStyle: AppStyle.buttonText),
              ],
            ),
          ),
          const Positioned(
            top: 154,
            left: 426,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App icon',
                  style: AppStyle.buttonText,
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
