import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';
import 'package:tiger_fortune_app/widgets/outlined_text_widget.dart';

class PausePage extends StatelessWidget {
  const PausePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgred,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const OutlinedTextWidget(text: 'Pause', fontSize: 32),
                const SizedBox(height: 110),
                InkwellTextButtonWidget(
                    color: AppColor.red,
                    borderColor: AppColor.darkRed,
                    text: 'Continue',
                    width: 241,
                    height: 56,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    textStyle: AppStyle.buttonText),
                const SizedBox(height: 8),
                InkwellTextButtonWidget(
                    color: AppColor.red,
                    borderColor: AppColor.darkRed,
                    text: 'To main',
                    width: 241,
                    height: 56,
                    onTap: () {
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
                    },
                    textStyle: AppStyle.buttonText),
                const SizedBox(height: 8),
                InkwellTextButtonWidget(
                    color: AppColor.red,
                    borderColor: AppColor.darkRed,
                    text: 'Exit',
                    width: 241,
                    height: 56,
                    onTap: () {
                      exit(0);
                    },
                    textStyle: AppStyle.buttonText),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 60),
              child: InkwellButtonWidget(
                  color: AppColor.red,
                  borderColor: AppColor.darkRed,
                  width: 48,
                  height: 49,
                  onTap: () {
                    Navigator.of(context).pushNamed('/settings');
                  },
                  assetPath: 'assets/images/settings_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}
