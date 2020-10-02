import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/helpers/route_generator.dart';
import '../lib/features/login/presentation/pages/signup.dart';

final Size iPhone8Plus = Size(414.0, 716.0); // Size for iPhone8Plus
final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized();

void main() {
  testWidgets("test attempt to create invalid name shows error message",
      _testShowErrorOnInvalidName);
  testWidgets(
      "test that the signup page properly presents", _testSignupPagePresents);
  testWidgets("test attempt to create invalid email shows error message",
      _testShowErrorOnInvalidEmail);
  testWidgets("test attempt to create invalid password shows error message",
      _testShowErrorOnInvalidPassword);
  testWidgets("test navigation to home screen", _testSignupPageNavigatesToHome);
}

// MARK: - Tests

// test that the signup page properly presents
Future<void> _testSignupPagePresents(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(SignupPage()));
  expect(find.byKey(SignupPage.nameTextFieldKey), findsOneWidget);
  expect(find.byKey(SignupPage.emailTextFieldKey), findsOneWidget);
  expect(find.byKey(SignupPage.passwordTextFieldKey), findsOneWidget);
}

// test attempt to create invalid name shows error message
Future<void> _testShowErrorOnInvalidName(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(SignupPage()));

  // inserting VALID email into the email textfield
  // VALID email contains '@'
  final String validEmail = 'jon.brasileiro@gmail.com';
  await tester.enterText(find.byKey(SignupPage.emailTextFieldKey), validEmail);
  await tester.pumpAndSettle();

  // inserting invalid name into the name textfield
  // invalid name does not contain ' '
  final String invalidName = 'Jonathan';
  await tester.enterText(find.byKey(SignupPage.nameTextFieldKey), invalidName);
  await tester.pumpAndSettle();

  // inserting VALID password into the password textfield
  // VALID password contains more than 6 characters
  final String validPassword = '8756483';
  await tester.enterText(
      find.byKey(SignupPage.passwordTextFieldKey), validPassword);
  await tester.pumpAndSettle();

  // performing a tap in the login button
  await tester.tap(find.text('Sign up'));
  await tester.pumpAndSettle();

  expect(find.text('Enter both first and last name'), findsOneWidget);
  expect(find.text('Not a valid email'), findsNothing);
  expect(find.text('Must be at least 6 characters long'), findsNothing);
}

// test attempt to create invalid email shows error message
Future<void> _testShowErrorOnInvalidEmail(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(SignupPage()));

  // inserting invalid email into the email textfield
  // invalid email does not contain '@'
  final String invalidEmail = 'jon.brasileirogmail.com';
  await tester.enterText(
      find.byKey(SignupPage.emailTextFieldKey), invalidEmail);
  await tester.pumpAndSettle();

  // inserting VALID name into the name textfield
  // VALID name contains a ' '
  final String validName = 'Jonathan Oliveira';
  await tester.enterText(find.byKey(SignupPage.nameTextFieldKey), validName);
  await tester.pumpAndSettle();

  // inserting VALID password into the password textfield
  // VALID password contains more than 6 characters
  final String validPassword = '8756483';
  await tester.enterText(
      find.byKey(SignupPage.passwordTextFieldKey), validPassword);
  await tester.pumpAndSettle();

  // performing a tap in the signup button
  await tester.tap(find.text('Sign up'));
  await tester.pumpAndSettle();

  expect(find.text('Enter both first and last name'), findsNothing);
  expect(find.text('Not a valid email'), findsOneWidget);
  expect(find.text('Must be at least 6 characters long'), findsNothing);
}

// test attempt to create invalid password shows error message
Future<void> _testShowErrorOnInvalidPassword(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(SignupPage()));

  // inserting VALID email into the email textfield
  // VALID email contains '@'
  final String validEmail = 'jon.brasileiro@gmail.com';
  await tester.enterText(find.byKey(SignupPage.emailTextFieldKey), validEmail);
  await tester.pumpAndSettle();

  // inserting VALID name into the name textfield
  // VALID name contains a ' '
  final String validName = 'Jonathan Oliveira';
  await tester.enterText(find.byKey(SignupPage.nameTextFieldKey), validName);
  await tester.pumpAndSettle();

  // inserting invalid password into the password textfield
  // invalid password contains less than 6 characters
  final String invalidPassword = '8783';
  await tester.enterText(
      find.byKey(SignupPage.passwordTextFieldKey), invalidPassword);
  await tester.pumpAndSettle();

  // performing a tap in the signup button
  await tester.tap(find.text('Sign up'));
  await tester.pumpAndSettle();

  expect(find.text('Enter both first and last name'), findsNothing);
  expect(find.text('Not a valid email'), findsNothing);
  expect(find.text('Must be at least 6 characters long'), findsOneWidget);
}

// test navigation to home screen
Future<void> _testSignupPageNavigatesToHome(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(SignupPage()));

  // inserting VALID email into the email textfield
  final String validEmail = 'jon.brasileiro@gmail.com';
  await tester.enterText(find.byKey(SignupPage.emailTextFieldKey), validEmail);
  await tester.pumpAndSettle();

  // inserting VALID name into the name textfield
  // VALID name contains a ' '
  final String validName = 'Jonathan Oliveira';
  await tester.enterText(find.byKey(SignupPage.nameTextFieldKey), validName);
  await tester.pumpAndSettle();

  // inserting VALID password into the password textfield
  final String validPassword = '8756483';
  await tester.enterText(
      find.byKey(SignupPage.passwordTextFieldKey), validPassword);
  await tester.pumpAndSettle();

  // performing a tap in the login button
  await tester.tap(find.text('Sign up'));
  await tester.pumpAndSettle();

  expect(find.byType(Image), findsNWidgets(1));
  expect(find.byType(IconButton), findsNWidgets(3));
}

// MARK: - Private

Widget _buildTestableWidget(Widget widget) {
  return MaterialApp(
    home: widget,
    onGenerateRoute: RouteGenerator.generateRoute,
  );
}
