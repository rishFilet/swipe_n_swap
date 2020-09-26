import 'package:flutter/material.dart';
import 'package:swipe_swap/features/login/presentation/widgets/long_button.dart';

class LoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LongButton('Sign up for new account', action: () {}),
            LongButton('Log In', action: () {}),
            LongButton('Log in with Google', action: () {}),
            LongButton('Log in with Facebook', action: () {}),
          ],
        ),
      ),
    );
  }
}
