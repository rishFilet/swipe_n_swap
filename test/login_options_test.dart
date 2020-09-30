import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/helpers/route_generator.dart';
import '../lib/features/login/presentation/pages/login_options.dart';

final Size iPhone8Plus = Size(414.0, 716.0); // Size for iPhone8Plus
final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized();

void main() {
  testWidgets(
      "test that the initial page properly presents", _testFirstPagePresents);
  testWidgets(
      "test navigation to login screen", _testFirstPageNavigatesToLogin);
  testWidgets("test navigation to login screen and back",
      _testFirstPageNavigatesToLoginAndBack);
}

// MARK: - Tests

// test that the first page properly presents
Future<void> _testFirstPagePresents(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginOptions()));
  expect(find.text('logo/name'), findsOneWidget);
  expect(find.text('Sign up for new account'), findsOneWidget);
  expect(find.text('Log in with Google'), findsOneWidget);
  expect(find.text('Log in with Facebook'), findsOneWidget);
  expect(find.byType(FlatButton), findsNWidgets(4));
  expect(find.byType(Image), findsNWidgets(2));
}

// test navigation to login screen
Future<void> _testFirstPageNavigatesToLogin(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginOptions()));

  // finding and asserting the login button
  Finder loginButton = find.text('Log in');
  expect(loginButton, findsOneWidget);

  // performing a tap in the login button
  await tester.tap(loginButton);
  await tester.pumpAndSettle();

  expect(find.byType(TextFormField), findsNWidgets(2));
  expect(find.text('Email address'), findsOneWidget);
  expect(find.text('Password'), findsOneWidget);
  expect(find.text('Forgot your password?'), findsOneWidget);
}

// test navigation to login screen and back
Future<void> _testFirstPageNavigatesToLoginAndBack(WidgetTester tester) async {
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginOptions()));

  // finding and asserting the login button
  Finder loginButton = find.text('Log in');
  expect(loginButton, findsOneWidget);

  // performing a tap in the login button
  await tester.tap(loginButton);
  await tester.pumpAndSettle();

  // finding and asserting the back button
  Finder backButton = find.byType(IconButton);
  expect(backButton, findsOneWidget);

  // performing a tap in the back button
  await tester.tap(backButton);
  await tester.pumpAndSettle();

  expect(find.text('Log in with Google'), findsOneWidget);
  expect(find.text('Log in with Facebook'), findsOneWidget);
  expect(find.byType(FlatButton), findsNWidgets(4));
  expect(find.byType(Image), findsNWidgets(2));
}

// MARK: - Private

Widget _buildTestableWidget(Widget widget) {
  return MaterialApp(
    home: widget,
    onGenerateRoute: RouteGenerator.generateRoute,
  );
}
