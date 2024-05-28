import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../_export_core.dart';

class ButtonComponent extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const ButtonComponent({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        height: 64.0,
        // width: 150.0,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
          gradient: LinearGradient(
            colors: AppColorConstant.gradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 18.0,
            color: AppColorConstant.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
