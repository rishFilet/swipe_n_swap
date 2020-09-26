import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:swipe_swap/features/login/presentation/pages/login_page.dart';

void main() {
  testWidgets(
      "test that the initial login page properly presents", _blankCreation);
}

// MARK: - Tests

// test that the initial login page properly presents
Future<void> _blankCreation(WidgetTester tester) async {
  /*
  await binding.setSurfaceSize(iPhone8Plus);
  await tester.pumpWidget(_buildTestableWidget(LoginPage()));
  expect(find.text('Log in to find the best trades'), findsOneWidget);
  */
}

// MARK: - Private

final Size iPhone8Plus = Size(414.0, 716.0); // Size for iPhone8Plus
final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized();

Widget _buildTestableWidget(Widget widget) {
  return MaterialApp(home: widget);
}
