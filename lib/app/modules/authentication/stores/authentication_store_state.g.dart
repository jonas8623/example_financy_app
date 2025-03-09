// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationStoreState on BaseAuthenticationStoreState, Store {
  late final _$isLoadingAtom =
      Atom(name: 'BaseAuthenticationStoreState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$userModelAtom =
      Atom(name: 'BaseAuthenticationStoreState.userModel', context: context);

  @override
  UserModel? get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel? value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  late final _$helperTextAtom =
      Atom(name: 'BaseAuthenticationStoreState.helperText', context: context);

  @override
  String get helperText {
    _$helperTextAtom.reportRead();
    return super.helperText;
  }

  @override
  set helperText(String value) {
    _$helperTextAtom.reportWrite(value, super.helperText, () {
      super.helperText = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userModel: ${userModel},
helperText: ${helperText}
    ''';
  }
}
