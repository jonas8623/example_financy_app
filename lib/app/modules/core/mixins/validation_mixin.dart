import 'package:example_financy/app/modules/core/_export_core.dart';

mixin ValidationMixin {
  String? isNotEmpty(String? value) {
    if (value != null && value.isEmpty) {
      return "This field is empty";
    }
    return null;
  }

  String? hasNumber(String? value) {
    final expressionNumber = RegExp(AppConstant.expressionNumber);
    if (!expressionNumber.hasMatch(value!)) return "This field has number";
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
