import 'package:flutter/material.dart';
import 'package:swipe_swap/utilities/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.kAppTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is where the login should go',
            ),
          ],
        ),
      ),
    );
  }
}
