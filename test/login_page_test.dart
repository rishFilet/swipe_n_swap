import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:swipe_swap/features/login/presentation/pages/login_page.dart';
import 'package:swipe_swap/main.dart';

void main() {
  testWidgets(
      "test that the initial login page properly presents", _blankCreation);
}

Widget _buildTestableWidget(Widget widget) {
  return MediaQuery(
    data: MediaQueryData(
      //size: Size(414.0, 716.0), // Size for iPhone8Plus
      size: Size(1000.0, 2000.0),
    ),
    child: MaterialApp(home: widget),
  );
}

// test that the initial login page properly presents
Future<void> _blankCreation(WidgetTester tester) async {
  //await tester.pumpWidget(_buildTestableWidget(LoginPage()));
  await tester.pumpWidget(MyApp());
  expect(find.text('Log in to find the best trades'), findsOneWidget);
}

void _testFunction() {
	debugPrint('do nothing');
}
/*
   this is a comment
   */
