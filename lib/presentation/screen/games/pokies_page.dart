import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_cubit.dart';
import 'package:tiger_fortune_app/presentation/screen/win_page.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';

class PokiesPage extends StatefulWidget {
  const PokiesPage({super.key});

  @override
  State<PokiesPage> createState() => _PokiesPageState();
}

class _PokiesPageState extends State<PokiesPage> {
  final BalanceCubit cubit = BalanceCubit();
  int balance = BalanceCubit().getLastBalance();
  int win = 0;
  int bet = 500;
  bool isSpinning = false;
  final Random _random = Random();
  List<int> selectedImages = [0, 0, 0];

  void incrementBet() {
    setState(() {
      if (balance > bet + 500) {
        bet += 500;
      }
    });
  }

  void decrementBet() {
    setState(() {
      if (bet >= 500) {
        bet -= 500;
      }
    });
  }

  final List<String> images = [
    'assets/images/games_elements/1.png',
    'assets/images/games_elements/2.png',
    'assets/images/games_elements/3.png',
  ];

  Future<void> spin() async {
    if (!isSpinning) {
      isSpinning = true;
      for (int i = 0; i < 5; i++) {
        setState(() {
          selectedImages[0] = _random.nextInt(images.length);
          selectedImages[1] = _random.nextInt(images.length);
          selectedImages[2] = _random.nextInt(images.length);
        });
        await Future.delayed(const Duration(seconds: 1));
      }
      setState(() {
        isSpinning = false;
      });
      checkWin();
    }
  }

  void checkWin() async {
    Future.delayed(const Duration(seconds: 1));
    if (selectedImages.toSet().length == 1) {
      final int result = selectedImages[0];

      switch (result) {
        case 0:
          win = bet * 10;
        case 1:
          win = bet * 20;
        case 2:
          win = bet * 15;
      }
      Navigator.of(context).pushNamed('/win',
          arguments: {'type': GameType.pokies, 'winAmount': win});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pokies/bg-pokies.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 330,
                      width: 175,
                      child: Stack(
                        children: [
                          Image.asset(
                              'assets/images/games_elements/column.png'),
                          Align(
                            alignment: const Alignment(0, -0.6),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'BET',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: AppColor.yellow,
                                  ),
                                ),
                                Text(
                                  '$bet',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: 345,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 300,
                            width: 345,
                            child: Image.asset(
                                'assets/images/pokies/pokies-machine.png'),
                          ),
                          Align(
                            alignment: const Alignment(-0.6, 0.5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 260,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Roll(
                                          image: images[selectedImages[0 + 1]]),
                                      Roll(
                                          image: images[selectedImages[1 - 1]]),
                                      Roll(
                                          image: images[selectedImages[2 - 1]]),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 50,
                                  width: 290,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Roll(image: images[selectedImages[0]]),
                                      Roll(image: images[selectedImages[1]]),
                                      Roll(image: images[selectedImages[2]]),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 50,
                                  width: 260,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Roll(
                                          image: images[selectedImages[0 + 1]]),
                                      Roll(
                                          image: images[selectedImages[1 + 1]]),
                                      Roll(
                                          image: images[selectedImages[2 - 2]]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 175,
                          child: Stack(
                            children: [
                              Image.asset(
                                  'assets/images/games_elements/balance.png'),
                              Align(
                                alignment: const Alignment(0, 0.3),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'BALANCE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColor.blue,
                                      ),
                                    ),
                                    Text(
                                      '${cubit.getLastBalance()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            isSpinning
                                ? InkwellButtonWidget(
                                    color: AppColor.disabledButton,
                                    borderColor: AppColor.disabledButtonBorder,
                                    width: 68,
                                    height: 56,
                                    onTap: () {
                                      decrementBet();
                                    },
                                    assetPath: 'assets/images/minus_icon.png')
                                : InkwellButtonWidget(
                                    color: AppColor.red,
                                    borderColor: AppColor.darkRed,
                                    width: 68,
                                    height: 56,
                                    onTap: () {
                                      decrementBet();
                                    },
                                    assetPath: 'assets/images/minus_icon.png'),
                            const SizedBox(width: 4),
                            isSpinning
                                ? InkwellButtonWidget(
                                    color: AppColor.disabledButton,
                                    borderColor: AppColor.disabledButtonBorder,
                                    width: 68,
                                    height: 56,
                                    onTap: () {
                                      incrementBet();
                                    },
                                    assetPath: 'assets/images/plus_icon.png')
                                : InkwellButtonWidget(
                                    color: AppColor.red,
                                    borderColor: AppColor.darkRed,
                                    width: 68,
                                    height: 56,
                                    onTap: () {
                                      incrementBet();
                                    },
                                    assetPath: 'assets/images/plus_icon.png'),
                          ],
                        ),
                        const SizedBox(height: 30),
                        isSpinning || bet == 0 || balance < bet
                            ? const InkwellTextButtonWidget(
                                color: AppColor.disabledButton,
                                borderColor: AppColor.disabledButtonBorder,
                                text: 'SPIN',
                                textStyle: AppStyle.thickText,
                                width: 140,
                                height: 55,
                                onTap: null,
                              )
                            : InkwellTextButtonWidget(
                                color: AppColor.blue,
                                borderColor: AppColor.darkBlue,
                                text: 'SPIN',
                                textStyle: AppStyle.thickText,
                                width: 140,
                                height: 55,
                                onTap: () {
                                  setState(() {
                                    balance -= bet;
                                    cubit.balanceCases.saveBalance(balance);
                                  });
                                  spin();
                                  setState(() {
                                    balance += win;
                                    cubit.balanceCases.saveBalance(balance);
                                  });
                                }),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkwellButtonWidget(
                        color: AppColor.blue,
                        borderColor: AppColor.darkBlue,
                        width: 48,
                        height: 49,
                        onTap: () {
                          Navigator.of(context).pushNamed('/pause');
                        },
                        assetPath: 'assets/images/pause_icon.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Roll extends StatelessWidget {
  final String image;

  const Roll({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        child: Image.asset(image, height: 55, width: 55));
  }
}
