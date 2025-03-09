import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:mobx/mobx.dart';
part 'home_store_state.g.dart';

class HomeStoreState = BaseHomeStoreState with _$HomeStoreState;

abstract class BaseHomeStoreState with Store {
  @observable
  UserModel? userModel;

  @observable
  bool isLoading = false;
}
