import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_cubit.dart';
import 'package:tiger_fortune_app/presentation/screen/win_page.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';

class RoulettePage extends StatefulWidget {
  const RoulettePage({super.key});

  @override
  State<RoulettePage> createState() => _RoulettePageState();
}

class _RoulettePageState extends State<RoulettePage> {
  StreamController<int> controller = StreamController<int>();
  final BalanceCubit cubit = BalanceCubit();
  int balance = BalanceCubit().getLastBalance();
  int win = 0;
  int bet = 500;
  bool isSpinning = false;

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

  final items = <String>[
    'assets/images/games_elements/2.png',
    '100',
    'assets/images/games_elements/1.png',
    '50',
    'assets/images/games_elements/2.png',
    '0',
    'assets/images/games_elements/3.png',
    '20',
    'assets/images/games_elements/4.png',
    '0',
    '10000',
    '20',
    'assets/images/games_elements/1.png',
    '0',
  ];

  void onSpinEnd(int result) async {
    isSpinning = true;

    switch (result) {
      case 0:
        win = bet * 20;
      case 1:
        win = bet + 100;
      case 2:
        win = bet * 10;
      case 3:
        win = bet + 50;
      case 4:
        win = bet * 20;
      case 5:
        win = 0;
      case 6:
        win = bet * 15;
      case 7:
        win = bet + 20;
      case 8:
        win = bet * 5;
      case 9:
        win = 0;
      case 10:
        win = bet + 10000;
      case 11:
        win = bet + 20;
      case 12:
        win = bet * 10;
      case 13:
        win = 0;
    }
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/roulette/bg-roulette.png"),
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
                            alignment: const Alignment(0, -0.57),
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                            'assets/images/roulette/circal-bg.svg'),
                        SizedBox(
                          height: 275,
                          width: 275,
                          child: FortuneWheel(
                            physics: NoPanPhysics(),
                            animateFirst: false,
                            selected: controller.stream,
                            items: [
                              for (var i in items)
                                i.length < 10
                                    ? FortuneItem(
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 80),
                                            Text(
                                              i,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        style: const FortuneItemStyle(
                                          color: AppColor.brightYellow,
                                          borderColor: AppColor.dirtyYellow,
                                          borderWidth: 5,
                                        ),
                                      )
                                    : FortuneItem(
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 80),
                                            Image.asset(
                                              i,
                                              width: 35,
                                            ),
                                          ],
                                        ),
                                        style: const FortuneItemStyle(
                                          color: AppColor.brightYellow,
                                          borderColor: AppColor.dirtyYellow,
                                          borderWidth: 5,
                                        ),
                                      ),
                            ],
                            indicators: <FortuneIndicator>[
                              FortuneIndicator(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    'assets/images/roulette/indicator.svg'),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                      '$balance',
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
                                onTap: () async {
                                  if (balance > 0) {
                                    setState(() {
                                      balance -= bet;
                                      cubit.balanceCases.saveBalance(balance);
                                      final int result =
                                          Fortune.randomInt(0, items.length);
                                      controller.add(result);
                                      onSpinEnd(result);
                                      Future.delayed(const Duration(seconds: 6),
                                          () {
                                        setState(() {
                                          isSpinning = false;
                                        });
                                        Navigator.of(context).pushNamed('/win',
                                            arguments: {
                                              'type': GameType.roulette,
                                              'winAmount': win
                                            });
                                        setState(() {
                                          balance += win;
                                          cubit.balanceCases
                                              .saveBalance(balance);
                                        });
                                      });
                                    });
                                  }
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.all(10),
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
