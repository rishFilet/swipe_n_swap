import 'package:flutter/material.dart';
import 'package:swipe_swap/features/login/presentation/widgets/long_button.dart';
import 'package:swipe_swap/utilities/constants.dart';

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
                  Container(
                    width: 156.0,
                    height: 156.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC4C4C4),
                    ),
                    child: Center(
                      child:
                          Text('logo/name', style: Constants.kTextDefaultStyle),
                    ),
                  ),
                  SizedBox(height: 110),
                  LongButton('Sign up for new account', action: () {}),
                  SizedBox(height: 8),
                  LongButton('Log In', action: () {}),
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
