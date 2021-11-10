import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trove/ui/shared/long_button.dart';
import 'package:trove/utils/styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            'assets/icons/oval_1_splash.svg',
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
            'assets/icons/oval_2_splash.svg',
          ),
        ),
        Positioned.fill(
          bottom: 100,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/png_icons/onboarding_icon.png',
            ),
          ),
        ),
        Positioned.fill(
          top: 400,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Borrow against your stock portfolio at a low interest rate.',
              style: AppTextStyle.blackBold24,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned.fill(
            top: 600,
            child: Align(
                alignment: Alignment.center,
                child: LongButton(onPressed: () {}, label: 'Get started')))
      ]),
    );
  }
}
