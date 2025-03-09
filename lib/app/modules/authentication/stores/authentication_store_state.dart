import 'package:mobx/mobx.dart';

import '../../core/_export_core.dart';
part 'authentication_store_state.g.dart';

class AuthenticationStoreState = BaseAuthenticationStoreState
    with _$AuthenticationStoreState;

abstract class BaseAuthenticationStoreState with Store {
  @observable
  bool isLoading = false;

  @observable
  UserModel? userModel;

  @observable
  String helperText =
      "Must have at least 8 characters, 1 capital letter and 1 number";
}
