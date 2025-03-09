import 'dart:async';

import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeGuard extends RouteGuard {

  HomeGuard() : super(redirectTo: "/onBoarding");

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<AuthenticationStoreState>().userModel != null;
  }
}
