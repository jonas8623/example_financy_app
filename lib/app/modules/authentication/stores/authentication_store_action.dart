import 'dart:convert';
import 'package:example_financy/app/modules/core/_export_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../_export_authentication.dart';
part 'authentication_store_action.g.dart';

class AuthenticationStoreAction = BaseAuthenticationStoreAction
    with _$AuthenticationStoreAction;

abstract class BaseAuthenticationStoreAction with Store {
  final AuthenticationStoreState _authenticationStoreState;
  final CoreInterface _authenticationInterface;
  final SecureStorage _secureStorage;

  BaseAuthenticationStoreAction(
    this._authenticationInterface,
    this._secureStorage,
    this._authenticationStoreState,
  );

  @action
  Future<void> _storeUserData() async {
    if (_authenticationStoreState.userModel?.id != null) {
      await _secureStorage
          .write(
            key: AppConstant.userKey,
            value: _authenticationStoreState.userModel!.toJson(),
          )
          .then((value) => _launchHomePage());
    }
  }

  @action
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    _authenticationStoreState.isLoading = true;

    try {
      _authenticationStoreState.userModel =
          await _authenticationInterface.signUp(
        email: email,
        password: password,
        name: name,
      );

      await _storeUserData();
      return true;
    } catch (e) {
      return false;
    } finally {
      _authenticationStoreState.isLoading = false;
    }
  }

  @action
  Future<bool> signIn({required String email, required String password}) async {
    _authenticationStoreState.isLoading = true;

    try {
      _authenticationStoreState.userModel =
          await _authenticationInterface.signIn(
        email: email,
        password: password,
      );
      _storeUserData();
    } catch (e) {
      e.toString();
      return false;
    } finally {
      _authenticationStoreState.isLoading = false;
    }
    return true;
  }

  @action
  Future<void> decodeUserJson() async {
    final user = await _secureStorage.readOne(key: AppConstant.userKey);
    if (user != null) {
      final decoded = json.decode(user);
      _authenticationStoreState.userModel = UserModel.fromMap(decoded);
      _launchHomePage();
    }
  }

  @action
  Future<void> signOut() async {
    _authenticationStoreState.isLoading = true;

    try {
      await _authenticationInterface.signOut();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _authenticationStoreState.isLoading = false;
    }
  }

  @action
  void _launchHomePage() => Modular.to.pushReplacementNamed("/home/");
}
