import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';

class SpotSlotPage extends StatelessWidget {
  const SpotSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          foregroundDecoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/spotSlotPage/spotSlotBackground.png'),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 25,
          left: 776,
          child: InkwellButtonWidget(
              color: AppColor.blue,
              borderColor: AppColor.darkBlue,
              width: 48,
              height: 49,
              onTap: () {},
              assetPath: 'assets/images/pause_icon.png'),
        )
      ]),
    );
  }
}
