// import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
//
// class AuthenticationService implements AuthenticationInterface {
//   @override
//   Future<UserModel> signIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return UserModel(
//         id: email.hashCode.toString(),
//         email: email,
//         password: password,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   @override
//   Future<UserModel> signUp({
//     String? name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return UserModel(
//         id: email.hashCode.toString(),
//         email: email,
//         name: name,
//         password: password,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
