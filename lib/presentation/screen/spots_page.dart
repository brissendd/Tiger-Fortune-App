import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';
import 'package:tiger_fortune_app/widgets/outlined_text_widget.dart';

class SpotsPage extends StatefulWidget {
  const SpotsPage({super.key});

  @override
  State<SpotsPage> createState() => _SpotsPageState();
}

class _SpotsPageState extends State<SpotsPage> {
  final pageController = PageController();
  int selectedGame = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/spotsBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectedGame == 0
                      ? const SizedBox(width: 50)
                      : InkwellButtonWidget(
                          color: AppColor.red,
                          borderColor: AppColor.darkRed,
                          width: 48,
                          height: 49,
                          onTap: () {
                            setState(() {
                              pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          assetPath: 'assets/images/backArrow_icon.png'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          selectedGame = index;
                        });
                      },
                      controller: pageController,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const OutlinedTextWidget(
                                text: 'Spot Roulette', fontSize: 32),
                            Image.asset('assets/images/roulette.png'),
                            const SizedBox(height: 20),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const OutlinedTextWidget(
                                text: 'Spot Slot', fontSize: 32),
                            Image.asset('assets/images/spotSlot.png'),
                            const SizedBox(height: 20),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const OutlinedTextWidget(
                                text: 'Spot Pokies', fontSize: 32),
                            Image.asset('assets/images/pokies.png'),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  selectedGame == 2
                      ? const SizedBox(width: 30)
                      : InkwellButtonWidget(
                          color: AppColor.red,
                          borderColor: AppColor.darkRed,
                          width: 48,
                          height: 49,
                          onTap: () {
                            setState(() {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          assetPath: 'assets/images/reversedArrow_icon.png'),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: InkwellTextButtonWidget(
                      color: AppColor.blue,
                      borderColor: AppColor.darkBlue,
                      text: 'Play',
                      width: 161,
                      height: 56,
                      onTap: () {
                        switch (selectedGame) {
                          case 0:
                            Navigator.of(context).pushNamed('/roulette');
                          case 1:
                            Navigator.of(context).pushNamed('/spotSlot');
                          case 2:
                        }
                      },
                      textStyle: AppStyle.thickText),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkwellButtonWidget(
                    color: AppColor.blue,
                    borderColor: AppColor.darkBlue,
                    width: 48,
                    height: 49,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    assetPath: 'assets/images/backArrow_icon.png',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
