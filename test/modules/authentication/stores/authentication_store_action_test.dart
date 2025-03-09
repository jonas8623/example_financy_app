import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:example_financy/app/modules/core/constants/app_constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/class_mock.dart';

void main() {
  late FirebaseAuthenticationServiceMock firebaseAuthenticationServiceMock;
  late SecureStorageMock secureStorageMock;
  late AuthenticationStoreAction authenticationStoreAction;
  late AuthenticationStoreState authenticationStoreState;
  late UserModel userModel;

  setUpAll(() {
    firebaseAuthenticationServiceMock = FirebaseAuthenticationServiceMock();
    secureStorageMock = SecureStorageMock();
    userModel = UserModel(
      name: "Test",
      email: "test@gmail.com",
    );
    authenticationStoreState = AuthenticationStoreState();
    authenticationStoreAction = AuthenticationStoreAction(
      firebaseAuthenticationServiceMock,
      secureStorageMock,
      authenticationStoreState,
    );
  });

  group("Test authentication store action", () {
    test("Test sign up and return user", () async {
      when(
        () => firebaseAuthenticationServiceMock.signUp(
          email: "test@gmail.com",
          password: "123456",
          name: "Test",
        ),
      ).thenAnswer((invocation) async => userModel);

      when(() => secureStorageMock.write(
            key: AppConstant.userKey,
            value: userModel.toJson(),
          )).thenAnswer((_) async => {});

      await authenticationStoreAction.signUp(
        name: 'Test',
        email: 'test@gmail.com',
        password: '123456',
      );

      when(() =>
          secureStorageMock.readOne(
              key: AppConstant.userKey)).thenAnswer((_) async =>
          """{"name": "Test", "email":"test@gmail.com", "password": "123456"}""");

      final user = await secureStorageMock.readOne(key: AppConstant.userKey);

      expect(authenticationStoreState.userModel, same(userModel));
      expect(
          user,
          equals(
              """{"name": "Test", "email":"test@gmail.com", "password": "123456"}"""));
      verify(() async => await authenticationStoreAction.signUp(
            name: 'Test',
            email: 'test@gmail.com',
            password: '123456',
          )).called(1);
    });
  });
}
