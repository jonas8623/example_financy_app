import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/app_color_constant.dart';
import '../_export_splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            Expanded(
              child: Center(
                child: LottieBuilder.asset(
                  "assets/lotties/Animation - 1715996817824.json",
                ),
              ),
            )
          ],
        ),
        splashIconSize: 400,
        animationDuration: const Duration(seconds: 5),
        backgroundColor: AppColorConstant.backgroundSplash,
        nextScreen: const OnBoardingPage(),
        nextRoute: "/on_boarding",
      ),
    );
  }
}
