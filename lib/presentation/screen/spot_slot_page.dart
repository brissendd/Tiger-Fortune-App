import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger_fortune_app/app_colors.dart';
import 'package:tiger_fortune_app/app_style.dart';
import 'package:tiger_fortune_app/presentation/bloc/spots_page_cubit.dart';
import 'package:tiger_fortune_app/presentation/bloc/spots_page_state.dart';

class SpotSlotPage extends StatefulWidget {
  const SpotSlotPage({super.key});

  @override
  State<SpotSlotPage> createState() => _SpotSlotPageState();
}

class _SpotSlotPageState extends State<SpotSlotPage> {
  final SpotSlotCubit cubit = SpotSlotCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/spotSlotBackground.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.045,
            left: MediaQuery.of(context).padding.right,
            child: Image.asset(
              'assets/images/Win.png',
              height: MediaQuery.of(context).size.height * 0.85,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.045,
            right: MediaQuery.of(context).padding.right * -0.2,
            child: Image.asset(
              'assets/images/Slot.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.26,
            right: MediaQuery.of(context).padding.right * 0.8,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Balance.png',
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 68,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: AppColor.darkRed,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.red),
                          child: Image.asset('assets/images/minus_icon.png'),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Container(
                              width: 68,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 4),
                    Stack(
                      children: [
                        Container(
                          width: 68,
                          height: 56,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: AppColor.darkRed,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.red),
                          child: Image.asset('assets/images/plus_icon.png'),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Container(
                              width: 68,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 56,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: AppColor.darkBlue,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.blue),
                      child: const Center(child: Text('SPIN', style: AppStyle.blueButton,)),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: Container(
                          width: 140,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          //     Center(
          //       child: BlocBuilder<SpotSlotCubit, SpotSlotState>(
          //         bloc: cubit,
          //         builder: (context, state) {
          //           return Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text('CUBIT TESTING:'),
          //               Text('${state.bet}'),
          //             ],
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // floatingActionButton: Row(
          //   children: [
          //     FloatingActionButton(
          //       onPressed: cubit.incrementBet,
          //       tooltip: 'Increment',
          //       child: const Icon(Icons.add),
          //     ),
          //     FloatingActionButton(
          //       onPressed: cubit.decrementBet,
          //       tooltip: 'Increment',
          //       child: const Icon(Icons.remove),
          //     ),
        ],
      ),
    );
  }
}
