import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/features/login/presentation/pages/login_options.dart';

void main() {
  testWidgets(
      "test that the initial page properly presents", _testFirstPagePresents);
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

// MARK: - Private

final Size iPhone8Plus = Size(414.0, 716.0); // Size for iPhone8Plus
final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized();

Widget _buildTestableWidget(Widget widget) {
  return MaterialApp(home: widget);
}
