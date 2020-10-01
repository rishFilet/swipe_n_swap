import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/helpers/route_generator.dart';
import '../lib/features/login/presentation/pages/login.dart';

final Size iPhone8Plus = Size(414.0, 716.0); // Size for iPhone8Plus
final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized();

void main() {
  testWidgets(
      "test that the login page properly presents", _testLoginPagePresents);
  testWidgets("test attempt to save invalid email shows error message",
      _testShowErrorOnInvalidEmail);
  testWidgets("test attempt to save invalid password shows error message",
      _testShowErrorOnInvalidPassword);
}

// MARK: - Tests

// test that the login page properly presents
Future<void> _testLoginPagePresents(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginPage()));
  expect(find.byKey(LoginPage.emailTextFieldKey), findsOneWidget);
  expect(find.byKey(LoginPage.passwordTextFieldKey), findsOneWidget);
  expect(find.text('Forgot your password?'), findsOneWidget);
}

// test attempt to save invalid email shows error message
Future<void> _testShowErrorOnInvalidEmail(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginPage()));

  // inserting invalid email into the email textfield
  // invalid email does not contain '@'
  final String invalidEmail = 'jon.brasileirogmail.com';
  await tester.enterText(find.byKey(LoginPage.emailTextFieldKey), invalidEmail);
  await tester.pumpAndSettle();

  // inserting VALID password into the password textfield
  // VALID password contains more than 6 characters
  final String validPassword = '8756483';
  await tester.enterText(
      find.byKey(LoginPage.passwordTextFieldKey), validPassword);
  await tester.pumpAndSettle();

  // performing a tap in the login button
  await tester.tap(find.text('Log in'));
  await tester.pumpAndSettle();

  expect(find.text('Not a valid email'), findsOneWidget);
  expect(find.text('Must be at least 6 characters long'), findsNothing);
}

// test attempt to save invalid password shows error message
Future<void> _testShowErrorOnInvalidPassword(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginPage()));

  // inserting VALID email into the email textfield
  // VALID email contains '@'
  final String validEmail = 'jon.brasileiro@gmail.com';
  await tester.enterText(find.byKey(LoginPage.emailTextFieldKey), validEmail);
  await tester.pumpAndSettle();

  // inserting invalid password into the password textfield
  // invalid password contains less than 6 characters
  final String invalidPassword = '8783';
  await tester.enterText(
      find.byKey(LoginPage.passwordTextFieldKey), invalidPassword);
  await tester.pumpAndSettle();

  // performing a tap in the login button
  await tester.tap(find.text('Log in'));
  await tester.pumpAndSettle();

  expect(find.text('Not a valid email'), findsNothing);
  expect(find.text('Must be at least 6 characters long'), findsOneWidget);
}

// MARK: - Private

Widget _buildTestableWidget(Widget widget) {
  return MaterialApp(
    home: widget,
    onGenerateRoute: RouteGenerator.generateRoute,
  );
}
