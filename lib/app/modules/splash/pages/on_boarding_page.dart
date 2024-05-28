import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/_export_core.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  Widget _text({
    required String title,
    TextStyle? textStyle,
  }) =>
      Text(
        title,
        style: textStyle,
      );

  Widget _padding({required double top}) =>
      Padding(padding: EdgeInsets.only(top: top));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: AppColorConstant.backgroundOnBoarding,
                child: Image.asset("assets/images/onboarding_image.png"),
              ),
            ),
            _padding(top: 16.0),
            _text(
                title: "Spend Smarter",
                textStyle: AppTextStyleConstant.onBoardingTextStyle),
            _text(
                title: "Save More",
                textStyle: AppTextStyleConstant.onBoardingTextStyle),
            const ButtonComponent(text: "Get Started"),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have account? ",
                    style: AppTextStyleConstant.smallText.copyWith(
                      color: AppColorConstant.greyColor,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => log('message'),
                    text: "Sign in",
                    style: AppTextStyleConstant.smallText.copyWith(),
                  ),
                ],
              ),
            ),
            _padding(top: 40.0)
          ],
        ),
      ),
    );
  }
}
