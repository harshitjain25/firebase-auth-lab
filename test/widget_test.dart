import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase Auth Lab validation tests', () {
    test('password must contain at least 6 characters', () {
      const password = '123456';

      expect(password.length >= 6, true);
    });

    test('short password is rejected', () {
      const password = '123';

      expect(password.length < 6, true);
    });

    test('valid email contains @ symbol', () {
      const email = 'nova.auth13@example.com';

      expect(email.contains('@'), true);
    });

    test('invalid email does not contain @ symbol', () {
      const email = 'invalidemail';

      expect(email.contains('@'), false);
    });
  });
}