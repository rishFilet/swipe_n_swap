import 'package:flutter/material.dart';

import '../widgets/long_button.dart';
import '../widgets/base_textform.dart';
import '../widgets/main_logo.dart';
import '../widgets/back_button_nav_bar.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static const nameTextFieldKey = Key('nameTextFieldKey');
  static const emailTextFieldKey = Key('emailTextFieldKey');
  static const passwordTextFieldKey = Key('passwordTextFieldKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BackButtonNavBar(),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 236,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MainLogo(),
                        SizedBox(height: 45),
                        Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              BaseTextForm(
                                textFieldKey: SignupPage.nameTextFieldKey,
                                header: 'First and last name',
                                validator: (value) => !value.contains(' ')
                                    ? "Enter both first and last name"
                                    : null,
                                onSaved: (_) => null,
                              ),
                              SizedBox(height: 12),
                              BaseTextForm(
                                textFieldKey: SignupPage.emailTextFieldKey,
                                header: 'Email address',
                                validator: (value) => !value.contains('@')
                                    ? "Not a valid email"
                                    : null,
                                onSaved: (_) => null,
                              ),
                              SizedBox(height: 12),
                              BaseTextForm(
                                textFieldKey: SignupPage.passwordTextFieldKey,
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
                        LongButton('Sign up', action: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            Navigator.of(context).pushReplacementNamed('/main');
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
