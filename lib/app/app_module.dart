import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:example_financy/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module("/", module: AuthenticationModule());
    r.module("/home", module: HomeModule());
  }
}
