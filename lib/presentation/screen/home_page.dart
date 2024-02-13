import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_cubit.dart';
import 'package:tiger_fortune_app/presentation/bloc/balance_state.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';
import 'package:tiger_fortune_app/widgets/outlined_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BalanceCubit cubit = BalanceCubit();
  int currentTime = BalanceCubit().getCurrentTime();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainScreenBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 250,
                          child: OutlinedTextWidget(
                            text: 'TIGER FORTUNE',
                            fontSize: 48,
                          ),
                        ),
                        const SizedBox(
                          height: 90,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkwellTextButtonWidget(
                              color: AppColor.red,
                              borderColor: AppColor.darkRed,
                              text: 'Spots',
                              width: 240,
                              height: 55,
                              onTap: () {
                                Navigator.of(context).pushNamed('/spots');
                              },
                              textStyle: AppStyle.thickText,
                            ),
                            const SizedBox(height: 8),
                            InkwellTextButtonWidget(
                              color: AppColor.red,
                              borderColor: AppColor.darkRed,
                              text: 'Exit',
                              width: 240,
                              height: 55,
                              onTap: () {exit(0);},
                              textStyle: AppStyle.thickText,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 70),
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
                  BlocBuilder<BalanceCubit, BalanceState>(
                    bloc: cubit,
                    builder: (context, state) {
                      if (currentTime - state.lastClaimTime <
                          24 * 60 * 60 * 1000) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/daily_reward/large-envelope-open.png',
                                scale: 2,
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const OutlinedTextWidget(
                                          text: 'Daily Reward', fontSize: 24),
                                      const Text(
                                        'You can open daily',
                                        style: AppStyle.dailyRewardWhite,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            ' reward in ',
                                            style: AppStyle.dailyRewardWhite,
                                          ),
                                          CountdownTimer(
                                            textStyle: AppStyle.dailyRewardBlue,
                                            endTime: DateTime.now()
                                                    .millisecondsSinceEpoch +
                                                (24 * 60 * 60 * 1000 -
                                                    (currentTime -
                                                        state.lastClaimTime)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      InkwellTextButtonWidget(
                                          color: AppColor.blue,
                                          borderColor: AppColor.darkBlue,
                                          text: 'Open reward',
                                          textStyle: AppStyle.thickText,
                                          width: 162,
                                          height: 56,
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/daily');
                                          }),
                                    ]),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/daily_reward/envelope-close.png',
                                width: 100,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const OutlinedTextWidget(
                                  text: 'Daily Reward', fontSize: 24),
                            
                              const Text(
                                'Your daily reward is\nready.',
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkwellTextButtonWidget(
                                  color: AppColor.blue,
                                  borderColor: AppColor.darkBlue,
                                  text: 'Open reward',
                                  textStyle: AppStyle.thickText,
                                  width: 162,
                                  height: 56,
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/daily');
                                  }),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
