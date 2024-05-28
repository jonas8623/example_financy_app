import 'package:example_financy/app/modules/login/_export_login.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const OnBoardingPage());
    r.child("/sign_up", child: (_) => const SignUpPage());
  }
}
