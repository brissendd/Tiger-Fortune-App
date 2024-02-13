import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';
import 'package:tiger_fortune_app/widgets/outlined_text_widget.dart';

enum GameType {
  roulette,
  slot,
  pokies,
}

class WinPage extends StatefulWidget {
  const WinPage({super.key});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  late GameType _type;
  late int _winAmount;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null) {
      final Map<String, dynamic> args = arguments as Map<String, dynamic>;
      _type = args['type'] as GameType;
      _winAmount = args['winAmount'] as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_type == GameType.roulette
                ? "assets/images/win/win-roulette.png"
                : _type == GameType.slot
                    ? "assets/images/win/win-slot.png"
                    : "assets/images/win/win-pokies.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _type == GameType.roulette
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const OutlinedTextWidget(
                            text: 'Spot\nRoulette', fontSize: 32),
                        const SizedBox(height: 25),
                        Image.asset('assets/images/win/mini-roulette.png'),
                      ],
                    )
                  : _type == GameType.slot
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const OutlinedTextWidget(
                                text: 'Spot Slot', fontSize: 32),
                            const SizedBox(height: 25),
                            Image.asset('assets/images/win/mini-slot.png'),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const OutlinedTextWidget(
                                text: 'Spot Pokies', fontSize: 32),
                            const SizedBox(height: 25),
                            Image.asset('assets/images/win/mini-pokies.png'),
                          ],
                        ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const OutlinedTextWidget(text: 'you win', fontSize: 32),
                      Text(
                        '$_winAmount',
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: AppColor.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Column(
                    children: [
                      InkwellTextButtonWidget(
                        color: AppColor.red,
                        borderColor: AppColor.darkRed,
                        text: 'Play again',
                        width: 140,
                        height: 55,
                        textStyle: AppStyle.thickText,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(height: 15),
                      InkwellTextButtonWidget(
                        color: AppColor.red,
                        borderColor: AppColor.darkRed,
                        text: 'Main menu',
                        width: 140,
                        height: 55,
                        textStyle: AppStyle.thickText,
                        onTap: () {
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName('/'));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/images/win/win-column.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
