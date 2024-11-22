// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store_action.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationStoreAction on BaseAuthenticationStoreAction, Store {
  late final _$_storeUserDataAsyncAction = AsyncAction(
      'BaseAuthenticationStoreAction._storeUserData',
      context: context);

  @override
  Future<void> _storeUserData() {
    return _$_storeUserDataAsyncAction.run(() => super._storeUserData());
  }

  late final _$signUpAsyncAction =
      AsyncAction('BaseAuthenticationStoreAction.signUp', context: context);

  @override
  Future<bool> signUp(
      {required String email, required String password, required String name}) {
    return _$signUpAsyncAction
        .run(() => super.signUp(email: email, password: password, name: name));
  }

  late final _$signInAsyncAction =
      AsyncAction('BaseAuthenticationStoreAction.signIn', context: context);

  @override
  Future<bool> signIn({required String email, required String password}) {
    return _$signInAsyncAction
        .run(() => super.signIn(email: email, password: password));
  }

  late final _$decodeUserJsonAsyncAction = AsyncAction(
      'BaseAuthenticationStoreAction.decodeUserJson',
      context: context);

  @override
  Future<void> decodeUserJson() {
    return _$decodeUserJsonAsyncAction.run(() => super.decodeUserJson());
  }

  late final _$signOutAsyncAction =
      AsyncAction('BaseAuthenticationStoreAction.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$BaseAuthenticationStoreActionActionController =
      ActionController(name: 'BaseAuthenticationStoreAction', context: context);

  @override
  void _launchHomePage() {
    final _$actionInfo = _$BaseAuthenticationStoreActionActionController
        .startAction(name: 'BaseAuthenticationStoreAction._launchHomePage');
    try {
      return super._launchHomePage();
    } finally {
      _$BaseAuthenticationStoreActionActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
