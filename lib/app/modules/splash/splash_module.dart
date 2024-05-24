import 'package:example_financy/app/modules/splash/pages/splash_page.dart';
import 'package:example_financy/app/modules/splash/pages/on_boarding_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const SplashPage());
    r.child("/on_boarding", child: (_) => const OnBoardingPage());
  }
}
