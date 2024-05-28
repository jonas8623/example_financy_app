import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextComponent extends StatelessWidget {
  final TextStyle textStyle;
  final TextStyle textStyleAction;
  final String text;
  final String textAction;
  final void Function()? onTap;

  const RichTextComponent({
    super.key,
    required this.textStyle,
    required this.textStyleAction,
    required this.text,
    required this.textAction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: textStyle,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: textAction,
            style: textStyleAction,
          ),
        ],
      ),
    );
  }
}
