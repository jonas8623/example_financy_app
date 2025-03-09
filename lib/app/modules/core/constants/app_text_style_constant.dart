import 'package:example_financy/app/modules/core/constants/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyleConstant {
  AppTextStyleConstant._();

  static const splashTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w700,
    color: AppColorConstant.backgroundOnBoarding,
  );

  static final onBoardingTextStyle = GoogleFonts.inter(
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
    color: AppColorConstant.primaryColor,
  );

  static final smallText = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColorConstant.primaryColor,
  );

  static final TextStyle inputLabelTextStyle = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColorConstant.darkGrey,
  );

  static final TextStyle inputHintTextStyle = GoogleFonts.inter(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}
