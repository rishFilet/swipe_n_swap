import 'package:flutter/material.dart';

import '../widgets/long_button.dart';
import '../widgets/base_textform.dart';
import '../../../../utilities/constants.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 65.0),
          child: SingleChildScrollView(
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
                        child: Text(
                          'logo/name',
                          style: Constants.kTextDefaultStyle,
                        ),
                      ),
                    ),
                    SizedBox(height: 90),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          BaseTextForm(
                            header: 'Email address',
                            validator: (value) => !value.contains('@')
                                ? "Not a valid email"
                                : null,
                            onSaved: (_) => null,
                          ),
                          SizedBox(height: 12),
                          BaseTextForm(
                            header: 'Password',
                            validator: (value) => value.length < 6
                                ? "Must be at least 6 characters long"
                                : null,
                            onSaved: (_) => null,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    LongButton(
                      'Log in',
                      action: _manualLogin,
                    ),
                    SizedBox(height: 8),
                    LongButton(
                      'Forgot your password?',
                      action: () {},
                      style: LongButtonStyle.secondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _manualLogin() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }
  }
}
