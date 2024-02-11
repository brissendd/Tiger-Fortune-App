import 'package:flutter/material.dart';
import 'package:tiger_fortune_app/app_theme/app_colors.dart';
import 'package:tiger_fortune_app/app_theme/app_style.dart';
import 'package:tiger_fortune_app/widgets/inkwell_icon_button_widget.dart';
import 'package:tiger_fortune_app/widgets/inkwell_text_button_widget.dart';
import 'package:tiger_fortune_app/widgets/outlined_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 250,
                      child: OutlinedTextWidget(
                        text: 'TIGER FORTUNE',
                        fontSize: 48,
                      ),
                    ),
                    Column(
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
                          textStyle: AppStyle.buttonText,
                        ),
                        const SizedBox(height: 15),
                        InkwellTextButtonWidget(
                          color: AppColor.red,
                          borderColor: AppColor.darkRed,
                          text: 'Exit',
                          width: 240,
                          height: 55,
                          onTap: () {},
                          textStyle: AppStyle.buttonText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 70),
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
              Align(
                alignment: Alignment.centerRight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
