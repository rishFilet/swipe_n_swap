import 'package:flutter/material.dart';
import 'package:swipe_swap/utilities/constants.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Constants.kDefaultPadding,
            Constants.kDefaultPadding * 4,
            Constants.kDefaultPadding,
            0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Constants.kAppTitle,
            ),
            Text(
              'Log in to find the best trades',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: null,
                  child: Text('Google'),
                ),
                FlatButton(
                  onPressed: null,
                  child: Text('Facebook'),
                ),
              ],
            ),
            Text(
              'Or log in with Email',
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) =>
                        !value.contains('@') ? "Not a valid email" : null,
                    onSaved: (_) => null, // will send event to Bloc
                  ),
                  SizedBox(height: Constants.kDefaultPadding),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) => value.length < 6
                        ? "Must be at least 6 characters long"
                        : null,
                    onSaved: (_) => null,
                    obscureText: true, // will send event to Bloc
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: _manualLogin,
              child: Text('Log in'),
            ),
          ],
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
