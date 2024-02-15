import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_cubit.dart';
import 'package:tiger_fortune_app/presentation/screen/win_page.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';

import '../../../widgets/slot_machine.dart';

class SpotSlotPage extends StatefulWidget {
  const SpotSlotPage({super.key});

  @override
  State<SpotSlotPage> createState() => _SpotSlotPageState();
}

class _SpotSlotPageState extends State<SpotSlotPage> {
  final BalanceCubit cubit = BalanceCubit();
  int balance = BalanceCubit().getLastBalance();
  int win = 0;
  int bet = 500;
  bool isSpinning = false;
  late SlotMachineController _controller;
  List<int> selectedImages = [0, 0, 0, 0];

  @override
  void initState() {
    super.initState();
  }

  void onButtonTap({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 4 ? index : null);
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

  final List<Widget> images = [
    Image.asset('assets/images/games_elements/1.png'),
    Image.asset('assets/images/games_elements/2.png'),
    Image.asset('assets/images/games_elements/3.png'),
    Image.asset('assets/images/games_elements/4.png')
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
          arguments: {'type': GameType.slot, 'winAmount': win});
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
            image: AssetImage('assets/images/spotSlotBackground.png'),
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
                      width: 370,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/spot_slot/slot.png'),
                          Align(
                            alignment: const Alignment(0.2, 0.4),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                    height: 360,
                                    width: 334,
                                    child: Column(
                                      children: [
                                        SlotMachine(
                                          reelSpacing: 0,
                                          reelItemExtent: 45,
                                          reelHeight: 190,
                                          width: 400,
                                          reelWidth: 82,
                                          height: 334,
                                          rollItems: [
                                            RollItem(
                                                index: 0,
                                                child: Image.asset(
                                                    'assets/images/games_elements/1.png')),
                                            RollItem(
                                                index: 1,
                                                child: Image.asset(
                                                    'assets/images/games_elements/2.png')),
                                            RollItem(
                                                index: 2,
                                                child: Image.asset(
                                                    'assets/images/games_elements/3.png')),
                                            RollItem(
                                                index: 3,
                                                child: Image.asset(
                                                    'assets/images/games_elements/4.png')),
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
                                  onButtonTap(index: 3);
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
                  padding: const EdgeInsets.all(10),
                  child: InkwellButtonWidget(
                    color: AppColor.blue,
                    borderColor: AppColor.darkBlue,
                    width: 48,
                    height: 49,
                    onTap: () {
                      Navigator.of(context).pushNamed('/pause');
                    },
                    assetPath: 'assets/images/pause_icon.png',
                  ),
                ),
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
        child: Image.asset(image, height: 45, width: 45));
  }
}
