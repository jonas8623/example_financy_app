import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../_export_core.dart';

class TextFormFieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? textInputType;
  final String? hintText;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const TextFormFieldComponent({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputType,
    this.hintText,
    this.maxLength,
    this.textCapitalization,
    this.isPassword = false,
    this.inputFormatters,
    this.validator,
    this.helperText,
  });

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  bool _obscureText = true;
  String? _helperText;

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
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.next,
      obscureText: widget.isPassword ? _obscureText : false,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      cursorColor: AppColorConstant.secondColor,
      maxLength: widget.maxLength,
      style: AppTextStyleConstant.inputLabelTextStyle.copyWith(
        color: AppColorConstant.secondColor,
      ),
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      onChanged: (value) {
        if (value.length == 1) {
          setState(() => _helperText = null);
        } else if (value.isEmpty) {
          setState(() => _helperText = widget.helperText);
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        helperText: _helperText,
        helperMaxLines: 2,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColorConstant.secondColor,
        ),
        labelText: widget.labelText.toUpperCase(),
        labelStyle: AppTextStyleConstant.inputLabelTextStyle,
        border: _defaultBorder,
        enabledBorder: _defaultBorder,
        disabledBorder: _defaultBorder,
        focusedBorder: _defaultBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        errorMaxLines: 3,
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
