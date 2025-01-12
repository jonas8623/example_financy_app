import 'package:example_financy/app/modules/core/_export_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<CoreInterface>(FirebaseService.new);
    i.addInstance<SecureStorage>(SecureStorage());
  }
}
