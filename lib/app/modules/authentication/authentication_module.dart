import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:example_financy/app/modules/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<AuthenticationStoreState>(AuthenticationStoreState.new);
    i.addLazySingleton<AuthenticationStoreAction>(
        AuthenticationStoreAction.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const SplashPage());
    r.child("/onBoarding", child: (_) => const OnBoardingPage());
    r.child("/signUp", child: (_) => const SignUpPage());
    r.child("/signIn", child: (_) => const SigInPage());
  }
}
