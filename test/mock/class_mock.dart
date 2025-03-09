import 'package:example_financy/app/modules/authentication/_export_authentication.dart';
import 'package:example_financy/app/modules/core/_export_core.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthenticationServiceMock extends Mock implements CoreInterface {}

class SecureStorageMock extends Mock implements SecureStorage {}

class AuthenticationStoreActionMock extends Mock
    implements AuthenticationStoreAction {}
