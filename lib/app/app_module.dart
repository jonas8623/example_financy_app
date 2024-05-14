import 'package:example_financy/app/modules/core/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const SplashPage());
  }
}
