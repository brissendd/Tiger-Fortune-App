import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_style.dart';
import 'package:tiger_fortune_app/widgets/blue_arrow_button.dart';

class SpotsPage extends StatefulWidget {
  const SpotsPage({super.key});

  @override
  State<SpotsPage> createState() => _SpotsPageState();
}

class _SpotsPageState extends State<SpotsPage> {
  final List<Widget> spotsList = [
    // spot roulette
    Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Stack(
            children: [
              Text(
                'SPOT\nROULETTE',
                style: AppStyle.headline2Outline,
              ),
              const Text(
                'SPOT\nROULETTE',
                style: AppStyle.headline2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 17),
        Image.asset(
          'assets/images/roulette.png',
          width: 176.34,
          height: 180,
        )
      ],
    ),
    // spot slot
    Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Stack(
            children: [
              Text(
                'SPOT SLOT',
                style: AppStyle.headline2Outline,
              ),
              const Text(
                'SPOT SLOT',
                style: AppStyle.headline2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 17),
        Image.asset(
          'assets/images/spotSlot.png',
          width: 261.14,
          height: 180,
        )
      ],
    ),
    // spot pokies
    Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Stack(
            children: [
              Text(
                'SPOT POKIES',
                style: AppStyle.headline2Outline,
              ),
              const Text(
                'SPOT POKIES',
                style: AppStyle.headline2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 17),
        Image.asset(
          'assets/images/pokies.png',
          width: 211.92,
          height: 180,
        )
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/spotsBackground.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const Positioned(
            top: 24,
            left: 62,
            child: BlueArrowButton(),
          ),
          Positioned(
            top: 24,
            left: 334,
            width: 176.34,
            height: 280,
            child: PageView(
              children: [spotsList[0], spotsList[1], spotsList[2]],
            ),
          ),
          Positioned(
            top: 302,
            left: 341,
            child: Stack(
              children: [
                Container(
                  width: 161,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 4,
                      color: const Color.fromRGBO(24, 64, 134, 1),
                    ),
                    color: const Color.fromRGBO(38, 121, 228, 1),
                  ),
                  child: const Center(
                    child: Text('Play', style: AppStyle.blueButton),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: Container(
                      width: 161,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
