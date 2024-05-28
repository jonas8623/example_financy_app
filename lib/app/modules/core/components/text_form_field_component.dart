import 'package:flutter/material.dart';
import '../_export_core.dart';

class TextFormFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? textInputType;
  final String? hintText;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final bool isPassword;

  const TextFormFieldComponent({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputType,
    this.hintText,
    this.maxLength,
    this.textCapitalization,
    this.isPassword = false,
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  bool _obscureText = true;

  final _defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColorConstant.primaryColor,
    ),
  );

  final OutlineInputBorder _errorBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.next,
      obscureText: widget.isPassword ? _obscureText : false,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      cursorColor: AppColorConstant.primaryColor,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hintText,
        labelText: widget.labelText.toUpperCase(),
        labelStyle: AppTextStyleConstant.inputLabelTextStyle,
        border: _defaultBorder,
        enabledBorder: _defaultBorder,
        disabledBorder: _defaultBorder,
        focusedBorder: _defaultBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
