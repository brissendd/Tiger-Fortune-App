import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_cubit.dart';
import 'package:tiger_fortune_app/presentation/screen/win_pages/win_page.dart';
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
  late int win;
  int bet = 0;

  void incrementBet() {
    setState(() {
      if (balance > bet + 200) {
        bet += 200;
      }
    });
  }

  void decrementBet() {
    setState(() {
      if (bet > 200) {
        bet -= 200;
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
    switch (result) {
      case 0:
        balance += bet * 20;
        win = bet * 20;
      case 1:
        balance += bet + 100;
        win = 100;
      case 2:
        balance += bet * 10;
        win = bet * 10;
      case 3:
        balance += bet + 50;
        win = 50;
      case 4:
        balance += bet * 20;
        win = bet * 20;
      case 5:
        balance += bet + 0;
        win = 0;
      case 6:
        balance += bet * 15;
        win = bet * 15;
      case 7:
        balance += bet + 20;
        win = 20;
      case 8:
        balance += bet * 5;
        win = bet * 5;
      case 9:
        balance += bet + 0;
        win = 0;
      case 10:
        balance += bet + 10000;
        win = 10000;
      case 11:
        balance += bet + 20;
        win = 20;
      case 12:
        balance += bet * 10;
        win = bet * 10;
      case 13:
        balance += bet + 0;
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
                                    color: AppColor.blue,
                                  ),
                                ),
                                Text(
                                  '${bet}',
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
                        SvgPicture.asset('assets/images/roulette/circal-bg.svg'),
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
                            GestureDetector(
                              onTap: () {
                                decrementBet();
                              },
                              child: Image.asset(
                                  'assets/images/games_elements/minus_icon.png'),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                incrementBet();
                              },
                              child: Image.asset(
                                  'assets/images/games_elements/plus_icon.png'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        InkwellTextButtonWidget(
                          color: AppColor.blue,
                          borderColor: AppColor.darkBlue,
                          text: 'SPIN',
                          textStyle: AppStyle.thickText,
                          width: 140,
                          height: 55,
                          onTap: () async {
                            if (balance > 200) {
                              balance -= 200;
                              setState(() {
                                final int result =
                                    Fortune.randomInt(0, items.length);
                                print(result);
                                controller.add(result);
                                onSpinEnd(result);
                                Future.delayed(const Duration(seconds: 6), () {
                                  bet = 0;
                                  Navigator.of(context).pushNamed('/win',
                                      arguments: {
                                        'type': GameType.roulette,
                                        'winAmount': win
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
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/pause');
                      },
                      child: Image.asset('assets/images/pause_icon.png')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
