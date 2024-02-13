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

class DailyRewardPage extends StatefulWidget {
  const DailyRewardPage({super.key});

  @override
  State<DailyRewardPage> createState() => _DailyRewardPageState();
}

class _DailyRewardPageState extends State<DailyRewardPage> {
  final BalanceCubit cubit = BalanceCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/daily_reward/dailyBackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
              child: BlocBuilder<BalanceCubit, BalanceState>(
            bloc: cubit,
            builder: (context, state) {
              int currentTime = cubit.getCurrentTime();
              if (currentTime - state.lastClaimTime < 24 * 60 * 60 * 1000) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                          'assets/images/daily_reward/large-envelope-open.png'),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 200,
                        child: OutlinedTextWidget(
                          text: 'Daily Reward',
                          fontSize: 48,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        overflow: TextOverflow.visible,
                        softWrap: false,
                        text: const TextSpan(
                          text: 'We give you ',
                          style: AppStyle.dailyRewardWhite,
                          children: [
                            TextSpan(
                                text: '200 coins',
                                style: AppStyle.dailyRewardRed),
                            TextSpan(
                                text:
                                    '\nfor daily login to the\napplication. We are\nwaiting for you.',
                                style: AppStyle.dailyRewardWhite),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CountdownTimer(
                            textStyle: AppStyle.dailyRewardBlue,
                            endTime: DateTime.now().millisecondsSinceEpoch +
                                (24 * 60 * 60 * 1000 -
                                    (currentTime - state.lastClaimTime)),
                          ),
                          const InkwellTextButtonWidget(
                              color: Color.fromRGBO(181, 181, 181, 1),
                              borderColor: Color.fromRGBO(128, 128, 128, 1),
                              text: 'OPEN',
                              width: 140,
                              height: 56,
                              onTap: null,
                              textStyle: AppStyle.thickText),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                          'assets/images/daily_reward/large-envelope-close.png'),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 200,
                        child: OutlinedTextWidget(
                          text: 'Daily Reward',
                          fontSize: 48,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        overflow: TextOverflow.visible,
                        softWrap: false,
                        text: const TextSpan(
                          text: 'Every ',
                          style: AppStyle.dailyRewardWhite,
                          children: [
                            TextSpan(
                                text: '24 hours ',
                                style: AppStyle.dailyRewardBlue),
                            TextSpan(
                                text: 'you\ncan get your daily\nreward.',
                                style: AppStyle.dailyRewardWhite),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkwellTextButtonWidget(
                          color: AppColor.blue,
                          borderColor: AppColor.darkBlue,
                          text: 'OPEN',
                          width: 140,
                          height: 56,
                          onTap: () {
                            cubit.claimReward();
                          },
                          textStyle: AppStyle.thickText),
                    )
                  ],
                );
              }
            },
          )),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(30),
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
          ),
        ],
      ),
    );
  }
}
