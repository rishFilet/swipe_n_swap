import 'package:flutter/material.dart';

import '../widgets/long_button.dart';
import '../widgets/main_logo.dart';

class LoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 65.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 236,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MainLogo(),
                  SizedBox(height: 110),
                  LongButton(
                    'Sign up for new account',
                    action: () {},
                  ),
                  SizedBox(height: 8),
                  LongButton(
                    'Log in',
                    action: () => Navigator.of(context).pushNamed('/login'),
                  ),
                  SizedBox(height: 8),
                  LongButton(
                    'Log in with Google',
                    action: () {},
                    icon: 'assets/icons/google.png',
                  ),
                  SizedBox(height: 8),
                  LongButton(
                    'Log in with Facebook',
                    action: () {},
                    icon: 'assets/icons/facebook.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
