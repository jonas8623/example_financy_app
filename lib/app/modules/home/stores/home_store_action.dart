import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:example_financy/app/modules/core/services/firebase_authentication_service.dart';
import 'package:example_financy/app/modules/core/_export_core.dart';
import 'package:example_financy/app/modules/home/_export_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_store_action.g.dart';

class HomeStoreAction = BaseHomeStoreAction with _$HomeStoreAction;

abstract class BaseHomeStoreAction with Store {
  final _homeStoreState = Modular.get<HomeStoreState>();
  final _secureStorage = SecureStorage();
  final CoreInterface _authenticationService;

  BaseHomeStoreAction(this._authenticationService);

  Future<void> signOut() async {
    _homeStoreState.isLoading = true;

    try {
      await _secureStorage.deleteAll();
      await _authenticationService.signOut();
      Modular.to.popAndPushNamed("/onBoarding");
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      _homeStoreState.isLoading = false;
    }
  }
}
