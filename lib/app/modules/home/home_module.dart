import 'package:example_financy/app/modules/core/core_module.dart';
import 'package:example_financy/app/modules/home/_export_home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  // TODO: implement imports
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeStoreState>(HomeStoreState.new);
    i.addLazySingleton<HomeStoreAction>(HomeStoreAction.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      "/",
      child: (_) => const HomePage(),
      guards: [
        HomeGuard(),
      ],
    );
  }
}
