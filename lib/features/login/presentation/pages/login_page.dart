import 'package:flutter/material.dart';
import 'package:swipe_swap/utilities/constants.dart';
import 'package:swipe_swap/utilities/size_config.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig(context); // initializing SizeConfig
    final double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            defaultSize * Constants.kDefaultPaddingMultiplier,
            defaultSize * Constants.kDefaultPaddingMultiplier * 4,
            defaultSize * Constants.kDefaultPaddingMultiplier,
            0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Constants.kAppTitle,
              style: TextStyle(
                color: Constants.kTextColor,
                fontSize: defaultSize * 3.4,
              ),
            ),
            SizedBox(height: defaultSize),
            Text(
              'Log in to find the best trades',
              style: TextStyle(
                color: Constants.kTextLightColor,
                fontSize: defaultSize * 1.6,
              ),
            ),
            SizedBox(height: defaultSize * Constants.kDefaultPaddingMultiplier),
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
            SizedBox(height: defaultSize * Constants.kDefaultPaddingMultiplier),
            Text(
              'Or log in with Email',
              style: TextStyle(
                color: Constants.kTextLightColor,
                fontSize: defaultSize * 1.4,
              ),
            ),
            SizedBox(height: defaultSize),
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
                  SizedBox(
                      height:
                          defaultSize * Constants.kDefaultPaddingMultiplier),
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
            SizedBox(height: defaultSize * Constants.kDefaultPaddingMultiplier),
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
