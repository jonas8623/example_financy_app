import 'package:example_financy/app/modules/core/_export_core.dart';

mixin ValidationMixin {
  String? isNotEmpty(String? value) {
    if (value != null && value.isEmpty) {
      return "This field is empty";
    }
    return null;
  }

  String? validateName(String? value) {
    final expressionName = RegExp(AppConstant.regexName);
    if (!expressionName.hasMatch(value!)) return "This is field incorrect";
    return null;
  }

  String? isEmailValid(String? value) {
    final expressionEmail = RegExp(AppConstant.regexEmail);
    if (!expressionEmail.hasMatch(value!)) return "This email is incorrect";
    return null;
  }

  String? isPasswordValid(String? value, String? response) {
    final expressionPassword = RegExp(AppConstant.regexPassword);
    if (!expressionPassword.hasMatch(value!)) {
      return response;
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) return "The password are different";
    return null;
  }

  String? validationList(List<String? Function()?> validations) {
    for (final validation in validations) {
      final currentValidation = validation!();
      if (currentValidation != null) return currentValidation;
    }
    return null;
  }
}
