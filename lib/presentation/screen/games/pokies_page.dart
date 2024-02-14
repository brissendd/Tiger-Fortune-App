import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slot_machine/slot_machine.dart';
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
  List<int> selectedImages = [0, 0, 0];
  late SlotMachineController _controller;

  @override
  void initState() {
    super.initState();
  }

  void onButtonTap({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 3 ? index : null);
  }

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
    'assets/images/games_elements/4.png',
  ];

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
        case 3:
          win = bet * 5;
      }
      Navigator.of(context).pushNamed('/win',
          arguments: {'type': GameType.pokies, 'winAmount': win});
      setState(() {
        balance += win;
        cubit.balanceCases.saveBalance(balance);
      });
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
                          Image.asset(
                              'assets/images/pokies/pokies-machine.png'),
                          Align(
                            alignment: const Alignment(-0.6, 0.5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                    height: 200,
                                    width: 280,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 23,
                                            ),
                                            SlotMachine(
                                              reelSpacing: 0,
                                              reelItemExtent: 60,
                                              reelHeight: 180,
                                              width: 246,
                                              reelWidth: 82,
                                              height: 200,
                                              rollItems: [
                                                RollItem(
                                                    index: 0,
                                                    child:
                                                        Image.asset(images[0])),
                                                RollItem(
                                                    index: 1,
                                                    child:
                                                        Image.asset(images[1])),
                                                RollItem(
                                                    index: 2,
                                                    child:
                                                        Image.asset(images[2])),
                                                RollItem(
                                                    index: 3,
                                                    child:
                                                        Image.asset(images[3])),
                                              ],
                                              onCreated: (controller) {
                                                _controller = controller;
                                              },
                                              onFinished: (resultIndexes) {
                                                // ignore: avoid_print
                                                print('Result: $resultIndexes');
                                                selectedImages = resultIndexes;
                                                checkWin();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
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
                                  setState(() {
                                    balance -= bet;
                                    cubit.balanceCases.saveBalance(balance);
                                    isSpinning = true;
                                  });
                                  onStart();
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  onButtonTap(index: 0);
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  onButtonTap(index: 1);
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  onButtonTap(index: 2);
                                  await Future.delayed(
                                      const Duration(seconds: 1));

                                  setState(() {
                                    isSpinning = false;
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
