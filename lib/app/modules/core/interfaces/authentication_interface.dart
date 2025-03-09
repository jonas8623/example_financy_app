import '../_export_core.dart';

abstract interface class CoreInterface {
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
