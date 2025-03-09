import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:example_financy/app/modules/core/_export_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import '../_export_authentication.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AuthenticationStoreAction _authenticationStoreAction;

  @override
  void initState() {
    _authenticationStoreAction = Modular.get<AuthenticationStoreAction>();
    _validateCredentials();
    super.initState();
  }

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
        nextRoute: "/onBoarding",
      ),
    );
  }

  void _validateCredentials() async =>
      await _authenticationStoreAction.decodeUserJson();
}
