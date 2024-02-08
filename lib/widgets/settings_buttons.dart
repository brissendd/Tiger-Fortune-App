import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_style.dart';

class SettingsPageButtons extends StatelessWidget {
  const SettingsPageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Text('Share with friends', style: AppStyle.redButton),
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
                child: Text('Privacy Policy', style: AppStyle.redButton),
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
                child: Text('Terms of use', style: AppStyle.redButton),
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
    );
  }
}
