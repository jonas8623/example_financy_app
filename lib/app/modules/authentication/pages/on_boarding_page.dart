import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
              textStyle: AppTextStyleConstant.onBoardingTextStyle,
            ),
            _text(
              title: "Save More",
              textStyle: AppTextStyleConstant.onBoardingTextStyle,
            ),
            ButtonComponent(
              text: "Get Started",
              onTap: () => Modular.to.pushNamed("/signUp"),
            ),
            RichTextComponent(
              textStyle: AppTextStyleConstant.smallText.copyWith(
                color: AppColorConstant.greyColor,
              ),
              textStyleAction: AppTextStyleConstant.smallText.copyWith(),
              text: "Already have account? ",
              textAction: "Sign in",
              onTap: () => Modular.to.pushNamed("signIn"),
            ),
            _padding(top: 40.0)
          ],
        ),
      ),
    );
  }
}
