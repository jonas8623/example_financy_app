import 'package:example_financy/app/modules/core/constants/app_color_constant.dart';
import 'package:example_financy/app/modules/core/constants/app_text_style_constant.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColorConstant.gradients,
          ),
        ),
        child: const Text(
          "Financy",
          style: AppTextStyleConstant.splashTextStyle,
        ),
      ),
    );
  }
}
