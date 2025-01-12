import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/class_mock.dart';

void main() {
  late FirebaseAuthenticationServiceMock firebaseAuthenticationServiceMock;
  late UserModel userModel;

  setUp(() {
    firebaseAuthenticationServiceMock = FirebaseAuthenticationServiceMock();
    userModel = UserModel(
      name: "Test",
      email: "test@gmail.com",
    );
  });

  group('Tests sign up', () {
    test('Test sign up success', () async {
      when(
        () => firebaseAuthenticationServiceMock.signUp(
          name: 'Test',
          email: 'test@gmail.com',
          password: '123456',
        ),
      ).thenAnswer(
        (invocation) async => userModel,
      );

      final result = await firebaseAuthenticationServiceMock.signUp(
        name: 'Test',
        email: 'test@gmail.com',
        password: '123456',
      );

      expect(result, userModel);
    });

    test('Test sign up failure', () async {
      when(
        () => firebaseAuthenticationServiceMock.signUp(
          email: 'test@gmail.com',
          password: '123456',
        ),
      ).thenThrow(Exception("Error sign up"));

      expect(
        () => firebaseAuthenticationServiceMock.signUp(
          email: 'test@gmail.com',
          password: '123456',
        ),
        throwsException,
      );
    });
  });
}
